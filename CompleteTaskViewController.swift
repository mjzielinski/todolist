//
//  CompleteTaskViewController.swift
//  To Do List
//
//  Created by Michael Zielinski on 3/22/17.
//  Copyright © 2017 Worldengine. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var task = Task()
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var previousVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.importance {
            taskLabel.text = "❗️\(task.name)"
        } else {
            taskLabel.text = task.name
        }
        
    }
    
    @IBAction func completedTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndexRow)
        //* reloads the data in previous view controller
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
