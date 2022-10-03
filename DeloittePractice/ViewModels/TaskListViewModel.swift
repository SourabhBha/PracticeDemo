//
//  UserListViewModel.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation
import UIKit

class TaskListViewModel: NSObject {
    
    var taskListDataSource = TaskListDataSource()
    var taskListDelegate = TaskListDelegate()
    
    var taskData : TaskData?
    
    override init(){
        super.init()
    }
    
    func configureTaskList(){
        taskListDataSource.tasks = taskData
        taskListDelegate.tasks = taskData
    }
    
    func getTaskData(viewController: UIViewController, completion: @escaping(TaskData) -> ()){
        
            NetworkManager.sharedInstance.executeApi(BaseUrl.development.rawValue, endPoint: APIEndPoints.task.rawValue, reqModel: EmptyClass(), methodType: .get, parameter: nil, resultType: TaskData.self, viewController:viewController) { taskData in
                //print(response)
                DispatchQueue.main.async {
                    self.taskData = taskData
                    self.configureTaskList()
                    completion(taskData ?? TaskData())
                }
            }
    }
    
    func onClickLogoutButton(viewController: UIViewController?){
        UserDefaults.standard.removeObject(forKey: Constants.KString.token)
        DispatchQueue.main.async {
            if let authNV = viewController?.storyboard?.instantiateViewController(withIdentifier: Constants.ControllerId.authNV) as? UINavigationController{
                
                if let keyWindow = UIWindow.key {
                    //Do something
                    keyWindow.rootViewController = authNV
                }
            }
        }
    }
    
    func registerUserCell(tableView:UITableView?){
        TaskTableViewCell.registerUserCellXib(with: tableView ?? UITableView())
    }
    
    func configureUserTableView(tableView:UITableView?,viewController: UIViewController ){
        self.getTaskData(viewController: viewController) { [weak self] task in
            DispatchQueue.main.async {
                tableView?.dataSource = self?.taskListDataSource
                tableView?.delegate = self?.taskListDelegate
                tableView?.reloadData()
            }
        }
    }
}
