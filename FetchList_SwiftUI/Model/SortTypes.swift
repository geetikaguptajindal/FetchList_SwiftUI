//
//  SortTypes.swift
//  AAA_Test
//
//  Created by Geetika Gupta on 14/09/23.
//

import Foundation

enum SortedCategoty {
    case byName
    case byMarketValue
}

extension SortedCategoty {
    var title: String {
        switch(self) {
        case .byMarketValue:
            return "sortByName"
        case.byName:
            return "sortByValue"
        }
    }
    
    mutating func toggle() {
        switch(self) {
        case .byMarketValue:
            self = .byName
            
        case .byName:
            self = .byMarketValue
        }
    }
}
