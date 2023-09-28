//
//  ClubTargetType.swift
//  Created by Geetika Gupta on 02/08/23.
//

import Foundation

enum ClubTargetType {
    case getClubs
    case loadImage(String)
}

extension ClubTargetType: TargetType {
    
    var basePath: String {
        switch self {
        case .getClubs, .loadImage:
            return "https://public.allaboutapps.at/hiring/"
        }
    }
    
    var endPath: String {
        switch self {
        case .getClubs:
            return "clubs.json"
        case.loadImage(let image):
            return "images/".appending(image)
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .getClubs, .loadImage:
            return [
                "Accept": "application/vnd.github.v3+json"
            ]
        }
    }
    
    var parameter: [String : String]? {
        switch self {
        case .getClubs, .loadImage:
            return nil
        }
    }
}
