//
//  TasksViewController.swift
//  To Do List
//
//  Created by Michael Zielinski on 3/21/17.
//  Copyright © 2017 Worldengine. All rights reserved.
//

//* Editor -> Embed In -> Navigation Controller
    //* uncheck adjust scroll view insets on View Controller
//* Bar Button Item (System Item -> Add)
//* New View Controller
//* Ctrl drag old View Controller to new (Manual Segue -> Show)

import UIKit

//* add UITableViewDelegate, UITableViewDataSource
class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //* connect tableView to ViewController Code
    @IBOutlet weak var tableView: UITableView!
    
    //* create an empty array of Task objects
    var tasks: [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //* load the Task objects
        tasks = makeTasks()
        
        //* added these
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //* specify number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    //* specify cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.importance {
            cell.textLabel?.text = "❗️ \(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    //* function to create an array of Task objects
    func makeTasks() -> [Task] {
        let task1 = Task()
        let task2 = Task()
        let task3 = Task()
        task1.name = "Walk Cat"
        task2.name = "Eat Dog"
        task3.name = "Pick up Bart"
        task3.importance = true
        return [task1, task2, task3]
    }
    
    //* ctrl drag plus button to add action
    @IBAction func plusTapped(_ sender: Any) {
        //* give segue an Identifier
        //* performSegue with identifier
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    //* prepare for segue
    //* connects the two view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

