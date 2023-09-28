//
//  ClubUseCasesMock.swift
//  AAA_TestTests
//
//  Created by Geetika Gupta on 14/09/23.
//

import XCTest
import Combine

@testable import FetchList_SwiftUI

class ClubUseCasesMock : ClubUseCases {
    
    var isSuccessResponse: Bool = false
    
    func fetchClubs() async throws -> [ClubData] {
        if isSuccessResponse {
            let clubData = Bundle(for: type(of: self)).decode([Club].self, from: "Clubs")!
            return clubData.map{ $0.toClubData() }
        } else {
            throw HttpError.decodeError
        }
    }
    
}
   

