//
//  TasksViewController.swift
//  HW2.4
//
//  Created by Евгений Войтин on 05.07.2021.
//

import UIKit
import Bond
import ReactiveKit

class TasksViewController: UIViewController {
    @IBOutlet weak var tasksTableView: UITableView!
    
    var tasks = MutableObservableArray<TasksModel>()
    
    let tasksViewModel = TasksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksViewModel.tasksViewController = self
        
        tasks.bind(to: tasksTableView) { (dataSourse, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "TasksTableViewCell") as! TasksTableViewCell
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy'-'MM'-'dd' 'HH':'mm':'ssZZZ"
            cell.initCell(id: dataSourse[indexPath.row].id, header: dataSourse[indexPath.row].header, taskDescription: dataSourse[indexPath.row].taskDescription, creationDate: dateformatter.date(from: dataSourse[indexPath.row].creationDate)!, deadline: dateformatter.date(from: dataSourse[indexPath.row].deadline)!)
            return cell
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tasksViewModel.loadTasks()
    }

}
