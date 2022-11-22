//
//  AddTaskVC.swift
//  ToDo
//
//  Created by Kamol Madaminov on 22/11/22.
//

import UIKit

class AddTaskVC: UIViewController {

    @IBOutlet weak var titleTf: UITextField!
    @IBOutlet weak var descTxtV: UITextView!
    @IBOutlet weak var priorityBtn: UIButton!
    @IBOutlet weak var backView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.green.cgColor
        
        backView.transform = .init(translationX: 0, y: 1000)
        self.view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.backView.transform = .identity
            self.view.backgroundColor = .gray.withAlphaComponent(0.2)
        }

    }
    
    
    @IBAction func priorityTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    @IBAction func dismissTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.backView.transform = .init(translationX: 0, y: 1000)
            self.view.backgroundColor = .clear
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
}
