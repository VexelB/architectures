//
//  ViewController.swift
//  HW2.4
//
//  Created by Евгений Войтин on 25.06.2021.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak private var taskHeaderTxtField: UITextField!
    @IBOutlet weak private var taskDescriptionTxtField: UITextField!
    @IBOutlet weak private var taskDeadlineDatePicker: UIDatePicker!
    
    var TxtFields = Array<UITextField>()
    
    let model = AddTaskModel()
    
    func clearTxtFields() {
        for field in TxtFields {
            field.text = ""
        }
    }
    
    @IBAction func addTaskClicked(_ sender: Any) {
        guard let header = taskHeaderTxtField.text, let taskDescription = taskDescriptionTxtField.text
        else {
            return
        }
        model.addTask(header: header, taskDescription: taskDescription, creationDate: Date().description, deadline: taskDeadlineDatePicker.date.description)
        clearTxtFields()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TxtFields = [taskHeaderTxtField, taskDescriptionTxtField]
    }


}

