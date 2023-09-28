//
//  ContentView.swift
//  FetchList_SwiftUI
//
//  Created by Geetika Gupta on 26/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var clubModel = ViewModel(_defaultClubUseCases: DefaultClubUseCases(networkManeger: DefaultNetworkManger(_urlSession: URLSession(configuration: .default))))
        
    @StateObject var nwRechable = NetworkRechability()
    @State private var isRefreshView: Bool = false

    var body: some View {
        
        NavigationView {
            List(content: {
                ForEach(clubModel.clubData, id:\.id) { item in
                    NavigationLink(destination: ClubDetailView(selectedClub: item)) {
                        ClubCell(item: item)
                    }
                }
            })
            .listStyle(.plain)
            .navigationTitle("Clubs")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sort") {
                        clubModel.sort()
                    }
                    .foregroundColor(.white)
                }
            })
        }
        .overlay(content: {
            if clubModel.httpError != "" {
                Text(clubModel.httpError)
            }
        })
        
        .task {
            await clubModel.fetchClub()
        }
        
        .onAppear {
            nwRechable.start()
        }
        
        .refreshable {
            await clubModel.fetchClub()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
