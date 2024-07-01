//
//  TodoCoreDataExampleUITestsLaunchTests.swift
//  TodoCoreDataExampleUITests
//
//  Created by Nathanael Roberton on 6/9/24.
//

import XCTest

final class TodoCoreDataExampleUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func testInitialLaunchState() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Assertion
        XCTAssertTrue(app.tables.cells.count > 0, "The initial state should have some todo items")
    }
}
