//
//  Ex+UIViewController.swift
//  ToDo
//
//  Created by Kamol Madaminov on 22/11/22.
//
  
import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(groupType: GroupTypeEnum?, title: String? , message: String?, type: UIAlertController.Style, completion: @escaping ((GroupTypeEnum?)->Void)) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: type)
        
        guard let groupType = groupType else {
            let okBtn = UIAlertAction(title: "Ok", style: .default) { _ in
                completion(nil)
            }
            alertVC.addAction(okBtn)
            self.present(alertVC, animated: true, completion: nil)
            return
        }

        
        let finishedBtn = UIAlertAction(title: "Finish", style: .default) { _ in
            completion(.finished)
        }
        
        let unfinishedBtn = UIAlertAction(title: "UnFinish", style: .default) { _ in
            completion(.unFinished)
        }
        
        let archivedBtn = UIAlertAction(title: "Archive", style: .default) { _ in
            completion(.archived)
        }
        
        let unarchivedBtn = UIAlertAction(title: "UnArchive", style: .default) { _ in
            completion(.unarchived)
        }
        
        let deleteBtn = UIAlertAction(title: "Delete", style: .destructive) { _ in
            completion(.deleted)
        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel)
        
        switch groupType {
        case .new:
            alertVC.addAction(finishedBtn)
            alertVC.addAction(archivedBtn)
        case .archived:
            alertVC.addAction(finishedBtn)
            alertVC.addAction(unarchivedBtn)
        case .finished:
            alertVC.addAction(unfinishedBtn)
            alertVC.addAction(archivedBtn)
        case .unarchived:
            print("unarchived")
        case .unFinished:
            print("unFinished")
        case .deleted:
            print("deleted")
        }
        
        alertVC.addAction(deleteBtn)
        alertVC.addAction(cancelBtn)
        
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
}
