//
//  ContentView.swift
//  TodoCoreDataExample
//
//  Created by Nathanael Roberton on 6/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String? = "checklist"
    
    var body: some View {
        #if os(macOS)
        NavigationView {
            List {
                NavigationLink(destination: TodosView(), tag: "checklist", selection: $selection) {
                    Label("Todos", systemImage: "checklist")
                }
                NavigationLink(destination: SettingsView(), tag: "gear", selection: $selection) {
                    Label("Settings", systemImage: "gear")
                }
            }
            
            TodosView()
        }
        .toolbar {
            ToolbarItem {
                // Hack to maintain header height
                Button(action: {}) {
                    Label("Add Item", systemImage: "plus")
                }
                .opacity(0.0)
            }
        }
        #else
        TabView {
            TodosView()
                .tabItem {
                    Label("Todos", systemImage: "checklist")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        #endif
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
    }
}
