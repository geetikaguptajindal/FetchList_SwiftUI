//
//  ClubCell.swift
//  FetchList_SwiftUI
//
//  Created by Geetika Gupta on 27/09/23.
//

import SwiftUI

struct ClubCell: View {
    
    @State private var isAnimation: Bool = false
    var item: ClubData
    
    var body: some View {
        HStack {
            PhotoView(imageUrl: item.poster)
            ClubInformation(clubInformation: item)
        }
        .opacity(isAnimation ? 1 : 0.3)
        .offset(CGSize(width: 0 , height: isAnimation ? -10 : 0))
        .animation(Animation.linear(duration: 0.4), value: isAnimation)
        .onAppear {
            isAnimation =  true
        }
    }
}

struct ClubCell_Previews: PreviewProvider {
    static var previews: some View {
        ClubCell(item: ClubData(id: "", name: "", country: "", marketValue: 0, poster: ""))
    }
}
