//
//  Model.swift
//  AwaitDmeo
//
//  Created by Geetika Gupta on 22/07/23.
//

import Foundation
import SwiftUI

struct Club: Decodable {
    let id: String
    let name: String
    let country: String
    let value: Int
    let image: String
    
    // converting api model into local model
    func toClubData() -> ClubData {
        ClubData(id: self.id, name: self.name, country: self.country, marketValue: self.value, poster: self.image)
    }
}


struct ClubData: Hashable, Identifiable {
    let id: String
    let name: String
    let country: String
    let marketValue: Int
    let poster: String
}
