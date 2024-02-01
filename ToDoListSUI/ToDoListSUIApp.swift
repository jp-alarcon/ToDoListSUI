//
//  ToDoListSUIApp.swift
//  ToDoListSUI
//
//  Created by Pablo Alarcon on 1/31/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoListSUIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ToDoTask.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
