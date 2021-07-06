//
//  TasksTableViewCell.swift
//  HW2.4
//
//  Created by Евгений Войтин on 05.07.2021.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var taskDescriptionLbl: UILabel!
    @IBOutlet weak var deadlineDatePicker: UIDatePicker!
    @IBOutlet weak var creationDate: UIDatePicker!
    
    var id = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func initCell(id: Int, header:String, taskDescription: String, creationDate: Date, deadline: Date) {
        self.id = id
        self.headerLbl.text = header
        self.taskDescriptionLbl.text = taskDescription
        self.creationDate.date = creationDate
        self.deadlineDatePicker.date = deadline
    }
    
}
