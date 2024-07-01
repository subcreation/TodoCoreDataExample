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
        let context = PersistenceController.shared.container.viewContext
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let initialCount = try context.count(for: fetchRequest)
        
        // Action
        let newItem = Item(context: context)
        newItem.timestamp = Date()
        try context.save()
        
        // Assertion
        let finalCount = try context.count(for: fetchRequest)
        XCTAssertEqual(finalCount, initialCount + 1, "Item count should increase by 1")
    }

    func testRemoveTodoItem() throws {
        // Setup
        let context = PersistenceController.shared.container.viewContext
        let newItem = Item(context: context)
        newItem.timestamp = Date()
        try context.save()
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let initialCount = try context.count(for: fetchRequest)
        
        // Action
        context.delete(newItem)
        try context.save()
        
        // Assertion
        let finalCount = try context.count(for: fetchRequest)
        XCTAssertEqual(finalCount, initialCount - 1, "Item count should decrease by 1")
    }

    func testCompleteTodoItem() throws {
        // Setup
        let context = PersistenceController.shared.container.viewContext
        let newItem = Item(context: context)
        newItem.timestamp = Date()
        try context.save()
        
        // Action
        newItem.setValue(true, forKey: "isCompleted")
        try context.save()
        
        // Assertion
        XCTAssertTrue(newItem.value(forKey: "isCompleted") as? Bool ?? false, "The item should be marked as completed")
    }
}
