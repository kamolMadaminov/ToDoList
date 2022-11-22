//
//  HomeVC.swift
//  ToDo
//
//  Created by Kamol Madaminov on 22/11/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableV: UITableView!
    
    var groupTasks: [TaskGroupDM] = [
        TaskGroupDM(tasks: [], groupType: .new),
        TaskGroupDM(tasks: [], groupType: .archived),
        TaskGroupDM(tasks: [], groupType: .finished)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }

    @IBAction func addTapped(_ sender: Any) {
    }
    
}


extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
extension HomeVC: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupTasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupTasks[section].tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTVC.identifier, for: indexPath) as? TaskTVC else { return UITableViewCell() }
        
        cell.updateCell(task: groupTasks[indexPath.section].tasks[indexPath.row], groupType: groupTasks[indexPath.section].groupType)
        
        return cell
    }
    
    func setUpTableView(){
        self.tableV.delegate = self
        self.tableV.dataSource = self
        self.tableV.separatorStyle = .none
        self.tableV.register(TaskTVC.nib(), forCellReuseIdentifier: TaskTVC.identifier)
    }
}
