//
//  TaskTVC.swift
//  ToDo
//
//  Created by Kamol Madaminov on 22/11/22.
//

import UIKit

class TaskTVC: UITableViewCell {

    static let identifier: String = "TaskTVC"
    static func nib() -> UINib {
        UINib(nibName: "TaskTVC", bundle: nil)
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var priorityV: UIView!
    @IBOutlet weak var typeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(task: TaskDM, groupType: GroupTypeEnum){
        titleLbl.text = task.title
        subTitleLbl.text = task.subTitle
        
        
        switch task.priority {
        case .high:
            priorityV.backgroundColor = .red
        case .medium:
            priorityV.backgroundColor = .yellow
        case .low:
            priorityV.backgroundColor = .green
        case .none:
            priorityV.backgroundColor = .gray
        }
        
        
        switch groupType {
        case .new:
            typeView.backgroundColor = .systemGray6
        case .archived:
            typeView.backgroundColor = .systemGray4
        case .finished:
            typeView.backgroundColor = .systemGray2
        }
        
    }
    
    
}
