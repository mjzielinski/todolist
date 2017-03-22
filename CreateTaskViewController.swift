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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //* action for add button tapped
    @IBAction func addTapped(_ sender: Any) {
        
        if taskNameTextField.text == "" {
            errorLabel.text = "Please enter task name"
        } else {
            //* set up context
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            //* create a task through managed object context
            let task = Task(context: context)
            
            task.name = taskNameTextField.text!
            task.importance = importantSwitch.isOn
            errorLabel.text = ""
            
            //* save context
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            //* pop back
            navigationController!.popViewController(animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
