//
//  ContentView.swift
//  ToDoListSUI
//
//  Created by Pablo Alarcon on 1/31/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [ToDoTask]

    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    NavigationLink {
                        DetailsView(task: task)
                    } label: {
                        CellView(task: task)
                    }

                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        modelContext.delete(tasks[index])
                    }
                })
            }
            .navigationTitle("ToDo List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        DetailsView()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }

                }
            }
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for: ToDoTask.self, inMemory: true)
}
