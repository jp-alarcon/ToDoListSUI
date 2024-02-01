//
//  DetailsView.swift
//  ToDoListSUI
//
//  Created by Pablo Alarcon on 1/31/24.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Bindable var task: ToDoTask = ToDoTask(title: "", completed: false)
    private var isNewTask = true
    
    init(task: ToDoTask) {
        self.task = task
        isNewTask = false
    }
    
    init(){}
    
    var body: some View {
        Form {
            HStack {
                Text("Title:")
                TextField("Title", text: $task.title)
            }
            Toggle("Completed", isOn: $task.completed)
        }
        .navigationTitle(isNewTask ? "New Task" : task.title)
        .toolbar {
            if isNewTask {
                ToolbarItem {
                    Button("Add") {
                        modelContext.insert(task)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    DetailsView(task: ToDoTask(title: "test", completed: false))
}
