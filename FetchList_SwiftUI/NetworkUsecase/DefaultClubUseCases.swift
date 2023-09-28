//
//  DefaultSearchUseCases.swift
//  AwaitDmeo
//
//  Created by Geetika Gupta on 22/07/23.
//

import Foundation

protocol ClubUseCases {
    func fetchClubs() async throws -> [ClubData]
}

final class DefaultClubUseCases: ClubUseCases {
    
    private let networkManeger: NetworkManager
    
    init(networkManeger: NetworkManager) {
        self.networkManeger = networkManeger
    }
    
    func fetchClubs() async throws -> [ClubData] {
        let searchTarget = ClubTargetType.getClubs
        
        do {
            let repositories = try await networkManeger.performRequest(withTarget: searchTarget, response: [Club].self)
            
            guard !repositories.isEmpty else {
                throw HttpError.noDataFound
            }

            let result = repositories.map{ $0.toClubData() }
            return result
        } catch {
            throw error
        }
    }
}
    
