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
        TaskGroupDM(tasks: [], groupType: .finished),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        
    }

    @IBAction func addTapped(_ sender: Any) {
        let vc = NewTaskVC(nibName: "NewTaskVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.addNewTask = { task in
            self.groupTasks[0].tasks.append(task)
            self.tableV.reloadData()
        }
        self.present(vc, animated: false)
    }
    
}

//MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = groupTasks[indexPath.section]
        showAlert(groupType: group.groupType, title: "Choose What to do", message: nil, type: .actionSheet) { [self] groupType in
            
            guard let groupType = groupType else { return }
            print("type = ",groupType.rawValue)
            
            switch groupType {
            case .new:
                 print("new")
            case .archived:
                let archivedTask = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                groupTasks[1].tasks.append(archivedTask)
            case .finished:
                let finishedTask = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                groupTasks[2].tasks.append(finishedTask)
            case .unarchived:
                let unarchivedTask = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                groupTasks[0].tasks.append(unarchivedTask)
            case .unFinished:
                let unfinishedTask = self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
                groupTasks[0].tasks.append(unfinishedTask)
            case .deleted:
                self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
            }
            self.tableV.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30 ))
        v.backgroundColor = .white
        
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 130, height: 30))
        lbl.text = groupTasks[section].groupType.rawValue.capitalized + " Tasks"
        lbl.layer.cornerRadius = 15
        lbl.textColor = .green
        lbl.font = .boldSystemFont(ofSize: 17)
        lbl.textAlignment = .center
        lbl.backgroundColor = .systemGray6
        
        v.addSubview(lbl)
        lbl.center = v.center
        
        return v
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let group = groupTasks[section]
        if group.tasks.isEmpty { return 0 } else { return 30 }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteBtn = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            self.groupTasks[indexPath.section].tasks.remove(at: indexPath.row)
            self.tableV.reloadData()
        }
        let config = UISwipeActionsConfiguration(actions: [deleteBtn])
        return config
    }
    
}


//MARK: - UITableViewDataSource
extension HomeVC: UITableViewDataSource {
    
    func setUpTableView() {
        self.tableV.delegate = self
        self.tableV.dataSource = self
        self.tableV.separatorStyle = .none
        self.tableV.register(TaskTVC.nib(), forCellReuseIdentifier: TaskTVC.identifier)
    }
    
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
    
}

