//
//  ViewControllerTests.swift
//  ImgurTests
//
//  Created by Attra on 24/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import XCTest
@testable import ImgurGalleryAssignment

class ViewControllerTests: XCTestCase {

    var sut: ViewController!

    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "viewController")
        sut = controller as? ViewController
        sut.loadViewIfNeeded()
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

    func testTableViewDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
    }

    func testTableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }

    func testTableViewRefreshController() {
        XCTAssertNotNil(sut.refreshControl)
    }

    func testLoadWeeklyImages() {
        waitForExecution(name: "wait for load weekly images", delay: 5)
        XCTAssertFalse(sut.imgurViewModel.arrayOfPostDetails.isEmpty)

    }

    func testLoadWeeklyImagesWithSearch_toggleOn() {
        sut.toggleButton.isOn = true
        sut.loadTopWeeklyImagesWithSearch("Bus")
        waitForExecution(name: "wait for load weekly images", delay: 5)
        XCTAssertFalse(sut.imgurViewModel.arrayOfPostDetails.isEmpty)

    }

    func testToggleOn() {
        XCTAssertFalse(sut.toggleButton.isOn)
        sut.toggleButton.sendActions(for: .touchUpInside)
    }

    fileprivate func waitForExecution(name method: String, delay: TimeInterval) {
        let expectation = XCTestExpectation(description: method)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: delay + 0.25)
    }
    
    func testHasSearchBar() {
        XCTAssertNotNil(sut.searchBar)
    }

    func testSearchBarDelegate() {
        XCTAssertNotNil(sut.searchBar.delegate)
    }
    
    func testSearchButtonClick() {
        sut.searchBar.text = "Car"
        sut.searchBarSearchButtonClicked(sut.searchBar)
        XCTAssertEqual(sut.searchBar.text, sut.searchKeyword)
    }
    
    func testSearchButtonClickWithEmptyText() {
        sut.searchBar.text = ""
        sut.searchBarSearchButtonClicked(sut.searchBar)
        XCTAssertEqual(sut.searchBar.text, "")
        
        UIApplication.shared.keyWindow?.rootViewController = sut
        waitForExecution(name: "wait for alert view", delay: 1)
        sut.addAlert(title: AlertMessages.emptySearchBarTitle, message: AlertMessages.noResultFoundMsg) {
            XCTAssertEqual(self.sut.presentedViewController?.title, AlertMessages.emptySearchBarTitle)
        }
        waitForExecution(name: "wait for alert view", delay: 1)

    }
}
