//
//  File.swift
//  ToDoListSUI
//
//  Created by Pablo Alarcon on 1/31/24.
//

import Foundation
import SwiftData

@Model
final class ToDoTask {
    var title: String
    var completed: Bool
    
    init(title: String, completed: Bool) {
        self.title = title
        self.completed = completed
    }
}
