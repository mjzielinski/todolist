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
    
    //* outlet to tableView
    @IBOutlet weak var tableView: UITableView!
    
    //* create an empty array of Task objects
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //* added these
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //* gets called when screen about to show up
    override func viewWillAppear(_ animated: Bool) {
        //* function gets tasks from core data
        getTasks()
        //* reload table view
        tableView.reloadData()
        //* save context
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    //* specify number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    //* specify cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //* list out the tasks from core data
        let task = tasks[indexPath.row]
        if task.importance {
            cell.textLabel?.text = "❗️ \(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    //* when a task is selected, select task segue and send the task
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    //* when plus button tapped, addSegue
    @IBAction func plusTapped(_ sender: Any) {
        //* give segue an Identifier
        //* performSegue with identifier
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    //* this function gets all tasks from core data and puts into tasks array
    func getTasks() {
        //* set up context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //* fetch request for tasks and put into array of Task objects
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            print ("Some error")
        }
    }
    
    //* prepare for segue
    //* connects the two view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //* sends the task to complete task view controller 
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
        }
    }
    
    
    
}

