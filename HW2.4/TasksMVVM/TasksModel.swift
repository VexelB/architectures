//
//  TasksModel.swift
//  HW2.4
//
//  Created by Евгений Войтин on 05.07.2021.
//

import Foundation

class TasksModel {
    let id: Int
    let header: String
    let taskDescription: String
    let creationDate: String
    let deadline: String
    var status: TaskStatus
    init(task: Task) {
        self.id = task.id
        self.header = task.header
        self.taskDescription = task.taskDescription
        self.creationDate = task.creationDate
        self.deadline = task.deadline
        self.status = task.status
    }
}
