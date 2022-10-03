//
//  UsersListViewController.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import UIKit

class TasksListViewController: UIViewController {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    let taskListViewModel = TaskListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    @IBAction func actionOnLogout(_ sender: Any) {
        taskListViewModel.onClickLogoutButton(viewController: self)
    }
    
    private func setupView(){
        self.title = Constants.KString.users
        taskListViewModel.registerUserCell(tableView: taskTableView)
        taskListViewModel.configureUserTableView(tableView: taskTableView, viewController: self)
    }
}

