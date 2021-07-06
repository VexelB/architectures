//
//  TasksViewModel.swift
//  HW2.4
//
//  Created by Евгений Войтин on 05.07.2021.
//

import Foundation
import Bond
import ReactiveKit

class TasksViewModel {
    private let dbService: DBServiceProtocol = Services.dBRealmService
    
    weak var tasksViewController: TasksViewController?
    
    func loadTasks() {
        dbService.loadTasks() { [weak self] tasks in
            self?.tasksViewController?.tasks.removeAll()
            tasks.forEach { task in
                self?.tasksViewController?.tasks.append(task)
            }
        }
    }
}
