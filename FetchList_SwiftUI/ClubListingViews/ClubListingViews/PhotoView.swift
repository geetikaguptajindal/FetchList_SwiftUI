//
//  PhotoView.swift
//  FetchList_SwiftUI
//
//  Created by Geetika Gupta on 26/09/23.
//

import SwiftUI

struct PhotoView: View {
    
    var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)){ image in
            image
                .resizable()
                .frame(width:80, height: 80)
                .padding(1)
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(imageUrl: "")
    }
}
