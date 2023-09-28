//
//  NetworkMock.swift
//  AAA_TestTests
//
//  Created by Geetika Gupta on 15/09/23.
//

import Foundation
import Combine

@testable import FetchList_SwiftUI

class NetworkMock: NetworkManager {
    
    var loadCallsCount = 0
    var success: Bool = true
    var error: Bool = false
    //var defaultClub: Club = Club
    
    var loadCalled: Bool {
        return loadCallsCount > 0
    }
    var responses = [ClubData]()
    
    func performRequest<T:Decodable>(withTarget targetpoint: TargetType, response: T.Type) async throws -> T {
        if success {
            
        }
        throw HttpError.unknown
    }
}
