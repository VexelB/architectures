//
//  AddTaskModel.swift
//  HW2.4
//
//  Created by Евгений Войтин on 05.07.2021.
//

import Foundation

class AddTaskModel {
    
    private let dbService: DBServiceProtocol = Services.dBRealmService
    
    func addTask(header: String, taskDescription: String, creationDate: String, deadline: String) {
        dbService.addTask(header: header, taskDescription: taskDescription, creationDate: creationDate, deadline: deadline)
    }
    
}
