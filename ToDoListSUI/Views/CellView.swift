//
//  CellView.swift
//  ToDoListSUI
//
//  Created by Pablo Alarcon on 1/31/24.
//

import SwiftUI

struct CellView: View {
    
    var task: ToDoTask
    
    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Image(systemName: task.completed ? "checkmark.square" : "square")
                .imageScale(.large)
                .onTapGesture {
                task.completed.toggle()
            }
        }
    }
}

#Preview {
    CellView(task: ToDoTask(title: "test", completed: false))
}
