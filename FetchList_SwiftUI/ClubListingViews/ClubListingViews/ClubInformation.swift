//
//  ClubInformation.swift
//  FetchList_SwiftUI
//
//  Created by Geetika Gupta on 26/09/23.
//

import SwiftUI

struct ClubInformation: View {
  
    var clubInformation: ClubData
    
    var body: some View {
            
        HStack {
            VStack(alignment: .leading) {
                Text(clubInformation.name.uppercased())
                    .bold()
                    .padding(.bottom, 4)
                Text(clubInformation.country)
                    .padding(.bottom, 1)
            }
    
            Spacer()
            
            HStack() {
                Text("million \(clubInformation.marketValue)" )
                    .padding(.top, 80)
            }
        }
    }
}

struct ClubInformation_Previews: PreviewProvider {
    static var previews: some View {
        ClubInformation(clubInformation: ClubData(id: "", name: "", country: "", marketValue: 0, poster: ""))
    }
}
