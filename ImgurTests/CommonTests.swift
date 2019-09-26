//
//  CommonTests.swift
//  ImgurTests
//
//  Created by Himanshu Garg on 25/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import XCTest
@testable import ImgurGalleryAssignment


class CommonTests: XCTestCase {
    var expectation: XCTestExpectation?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
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
    
    func testDateToStringValue()  {
        let stringValue = 1569406274.toString()
        assert(stringValue == "25-09-2019 10:11 AM", "Error in conversion")
        
    }
    
}
