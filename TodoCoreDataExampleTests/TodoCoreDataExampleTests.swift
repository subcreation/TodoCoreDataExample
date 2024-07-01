//
//  TodoCoreDataExampleTests.swift
//  TodoCoreDataExampleTests
//
//  Created by Nathanael Roberton on 6/9/24.
//

import XCTest

final class TodoCoreDataExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testAddTodoItem() throws {
        // Setup
        let todoManager = TodoManager()
        let initialCount = todoManager.items.count
        
        // Action
        todoManager.addItem(title: "New Task")
        
        // Assertion
        XCTAssertEqual(todoManager.items.count, initialCount + 1, "Item count should increase by 1")
        XCTAssertEqual(todoManager.items.last?.title, "New Task", "The last item's title should be 'New Task'")
    }

    func testRemoveTodoItem() throws {
        // Setup
        let todoManager = TodoManager()
        todoManager.addItem(title: "Task to be removed")
        let initialCount = todoManager.items.count
        
        // Action
        todoManager.removeItem(at: 0)
        
        // Assertion
        XCTAssertEqual(todoManager.items.count, initialCount - 1, "Item count should decrease by 1")
    }

    func testCompleteTodoItem() throws {
        // Setup
        let todoManager = TodoManager()
        todoManager.addItem(title: "Task to be completed")
        
        // Action
        todoManager.completeItem(at: 0)
        
        // Assertion
        XCTAssertTrue(todoManager.items[0].isCompleted, "The item should be marked as completed")
    }
}
