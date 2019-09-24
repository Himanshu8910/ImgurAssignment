//
//  ImgurSearchImageAPITest.swift
//  ImgurTests
//
//  Created by Himanshu Garg on 15/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import XCTest
@testable import ImgurGalleryAssignment

class ImgurSearchImageAPITest: XCTestCase {
    var expectation: XCTestExpectation?
    var apiManager: APIManager!
    override func setUp() {
        apiManager = APIManager()
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        apiManager = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Test Result - Success
    func testFetchWeeklyImages() {
        self.expectation = XCTestExpectation(description: "Fetch top weekly images")
        
        apiManager.request(type: ImgurGalleryResponseModel.self, service: Service.allImages) { (response) in
            switch response {
            case let .failure(error) :
                print(error)
                XCTFail()
            case let .success(result) :
                XCTAssertNotNil(result, "Unable to fetch the images.")

            case .err(let error):
                print(error.localizedDescription)
                XCTFail()
            }
            self.expectation?.fulfill()
        }
        wait(for: [self.expectation ?? XCTestExpectation(description: "expectation found nil")], timeout: 20)

    }

    // Test Result - Success
    func testFetchWeeklyImagesWithSearch() {
        self.expectation = XCTestExpectation(description: "Fetch images with search keyword")
        let textToSearch = "Bus"
        apiManager.request(type: ImgurGalleryResponseModel.self, service: Service.searchImages(text: textToSearch)) { (response) in
            switch response {
            case let .failure(error) :
                print(error)
                XCTFail()
            case let .success(result) :
                print(result)
                XCTAssertNotNil(result, "Unable to fetch the images.")

            case .err(let error):
                print(error.localizedDescription)
                XCTFail()
            }
            self.expectation?.fulfill()
        }
        wait(for: [self.expectation ?? XCTestExpectation(description: "expectation found nil")], timeout: 20)

    }
}
