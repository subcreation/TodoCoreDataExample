//
//  TodoCoreDataExampleUITests.swift
//  TodoCoreDataExampleUITests
//
//  Created by Nathanael Roberton on 6/9/24.
//

import XCTest

final class TodoCoreDataExampleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    func testAddTodoItemUI() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Action
        app.buttons["Add"].tap()
        let textField = app.textFields["New Task"]
        textField.tap()
        textField.typeText("Buy groceries")
        app.buttons["Save"].tap()
        
        // Assertion
        XCTAssertTrue(app.staticTexts["Buy groceries"].exists, "The new task should be displayed in the list")
    }

    func testCompleteTodoItemUI() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Action
        let firstCell = app.tables.cells.element(boundBy: 0)
        firstCell.buttons["Complete"].tap()
        
        // Assertion
        XCTAssertTrue(firstCell.buttons["Completed"].exists, "The task should be marked as completed")
    }

    func testDeleteTodoItemUI() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Action
        let firstCell = app.tables.cells.element(boundBy: 0)
        firstCell.swipeLeft()
        firstCell.buttons["Delete"].tap()
        
        // Assertion
        XCTAssertFalse(firstCell.exists, "The task should be deleted from the list")
    }
}
