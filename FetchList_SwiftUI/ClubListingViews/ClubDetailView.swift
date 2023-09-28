//
//  ClubDetailView.swift
//  FetchList_SwiftUI
//
//  Created by Geetika Gupta on 26/09/23.
//

import SwiftUI

struct ClubDetailView: View {
   
    let selectedClub: ClubData
    var body: some View {

        AsyncImage(url: URL(string: selectedClub.poster)) { image in
            image
                .resizable()
                .frame(minWidth: 0, maxHeight: 200)
                .padding()
                .cornerRadius(10)
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
        .padding()
              
        Text("the_club\(selectedClub.name)\(selectedClub.country)\(selectedClub.marketValue)")
            .multilineTextAlignment(.leading)
            .padding()
        
        Spacer()
                       
    }
}

struct ClubDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailView(selectedClub: ClubData(id: "", name: "", country: "", marketValue: 0, poster: ""))
    }
}
