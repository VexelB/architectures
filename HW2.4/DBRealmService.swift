//
//  DBRealmService.swift
//  HW2.4
//
//  Created by Евгений Войтин on 05.07.2021.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var id = 0
    @objc dynamic var header = ""
    @objc dynamic var taskDescription = ""
    @objc dynamic var creationDate = ""
    @objc dynamic var deadline = ""
    var status = TaskStatus.created
    
    convenience init(id: Int, header: String, taskDescription: String, creationDate: String, deadline: String) {
        self.init(value: [
            "id": id,
            "header": header,
            "taskDescription": taskDescription,
            "creationDate": creationDate,
            "deadline": deadline
        ])
    }
}

protocol DBServiceProtocol {
    
    func addTask(header: String, taskDescription: String, creationDate: String, deadline: String)
    
    func loadTasks(completion: @escaping ([TasksModel]) -> Void)
    
}

class DBRealmService: DBServiceProtocol {
    
    func addTask(header: String, taskDescription: String, creationDate: String, deadline: String) {
        DispatchQueue.dbThread.async {
            autoreleasepool {
                let realm = try! Realm()
                try! realm.write {
                    realm.add(Task(id: realm.objects(Task.self).count, header: header, taskDescription: taskDescription, creationDate: creationDate, deadline: deadline))
                }
            }
        }
    }
    
    func loadTasks(completion: @escaping ([TasksModel]) -> Void) {
        DispatchQueue.dbThread.async {
            autoreleasepool {
                let realm = try! Realm()
                var tasks = [TasksModel]()
                tasks = realm.objects(Task.self).sorted(byKeyPath: "id", ascending: true).map { TasksModel(task: $0) }
                DispatchQueue.main.async {
                    completion(tasks)
                }
            }
        }
    }
    
}

extension DispatchQueue {
    static let dbThread = DispatchQueue.init(label: "dbThread")
}
