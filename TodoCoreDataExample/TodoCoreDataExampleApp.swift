//
//  TodoCoreDataExampleApp.swift
//  TodoCoreDataExample
//
//  Created by Nathanael Roberton on 6/9/24.
//

import SwiftUI

@main
struct TodoCoreDataExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
