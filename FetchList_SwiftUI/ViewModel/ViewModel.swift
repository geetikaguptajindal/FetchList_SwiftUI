//
//  ViewModel.swift
//  AwaitDmeo
//
//  Created by Geetika Gupta on 22/07/23.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject {
    @Published private(set) var clubData:[ClubData] = []
    @Published private(set) var httpError: String = ""

    private var defaultClubUseCases: ClubUseCases
    private var sortType: SortedCategoty = .byName
    
    init(_defaultClubUseCases: ClubUseCases) {
        self.defaultClubUseCases = _defaultClubUseCases
    }
    
    func fetchClub() async {
        do {
            let clubs = try await defaultClubUseCases.fetchClubs()
            self.sortClub(clubs: clubs)
        } catch {
            httpError = error.localizedDescription
        }
    }
    
    func sort() {
        sortType.toggle()
        sortClub(clubs: clubData)
    }
    
    private func sortClub(clubs: [ClubData]) {
        var sortedElement = [ClubData]()
        switch sortType {
        case .byName:
            sortedElement = clubs.sorted(by: { club1, club2 in
                club1.name < club2.name
            })
        case .byMarketValue:
            sortedElement = clubs.sorted(by: { club1, club2 in
                club1.marketValue > club2.marketValue
            })
        }
        clubData = sortedElement
    }
}
