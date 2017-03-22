//
//  CreateTaskViewController.swift
//  To Do List
//
//  Created by Michael Zielinski on 3/22/17.
//  Copyright © 2017 Worldengine. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    //* outlet to text field
    @IBOutlet weak var taskNameTextField: UITextField!
    
    //* outlet to switch
    @IBOutlet weak var importantSwitch: UISwitch!
    
    //* used for error message
    @IBOutlet weak var errorLabel: UILabel!
    
    //* connection to previous view controller
    var previousVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //* action for add button tapped
    @IBAction func addTapped(_ sender: Any) {
        //* create a task from the outlet information
        let task = Task()
        task.name = taskNameTextField.text!
        task.importance = importantSwitch.isOn
        
        //* add new task to array in previous view controller
        if task.name == "" {
            errorLabel.text = "Name cannot be blank."
        } else {
            previousVC.tasks.append(task)
            errorLabel.text = ""
            //* reloads the data in previous view controller
            previousVC.tableView.reloadData()
            navigationController!.popViewController(animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
