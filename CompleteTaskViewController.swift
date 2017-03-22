//
//  CompleteTaskViewController.swift
//  To Do List
//
//  Created by Michael Zielinski on 3/22/17.
//  Copyright © 2017 Worldengine. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    //* set up variable to hold Task object
    var task : Task? = nil
    
    //* outlet to taskLabel
    @IBOutlet weak var taskLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //* set label from task object
        if task!.importance {
            taskLabel.text = "❗️\(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
    }
    
    //* when completed is tapped need to delete the item from core data
    @IBAction func completedTapped(_ sender: Any) {
        //* set up context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //* delete task from core data
        context.delete(task!)
        //* pop back navigation
        navigationController!.popViewController(animated: true)
    }
    
}
