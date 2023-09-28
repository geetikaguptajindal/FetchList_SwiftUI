//
//  FetchList_SwiftUITests.swift
//  FetchList_SwiftUITests
//
//  Created by Geetika Gupta on 26/09/23.
//

import XCTest
@testable import FetchList_SwiftUI

@MainActor
final class FetchList_SwiftUITests: XCTestCase {

    var viewModel: ViewModel!
    let usecases = ClubUseCasesMock()
    
     override func setUpWithError() throws {
        viewModel = ViewModel(_defaultClubUseCases: usecases)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testPerformanceExample() throws {
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_Is_LoadingView_Successfully() async {
        await viewModel.fetchClub()
        XCTAssertNotNil(self.viewModel.clubData)
    }
    
    func test_Is_LoadingView_Error() async {
        usecases.isSuccessResponse = false
        await viewModel.fetchClub()
        XCTAssertEqual(self.viewModel.clubData, [])
        XCTAssertEqual(self.viewModel.httpError, HttpError.decodeError.localizedDescription)
    }

}
