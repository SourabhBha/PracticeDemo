//
//  TaskListViewModelTestCases.swift
//  DeloittePracticeTests
//
//  Created by Sourabh Bhawsar on 21/09/22.
//

import XCTest
@testable import DeloittePractice

class TaskListViewModelTestCases: XCTestCase {

    let taskListViewController = TasksListViewController()
    let taskViewModel = TaskListViewModel()
    
    
    func testOnClickLogoutButton() {
        XCTAssertNotNil((taskViewModel.onClickLogoutButton(viewController: taskListViewController)))
        XCTAssertNotNil(UserDefaults.standard.removeObject(forKey: Constants.KString.token))
        DispatchQueue.main.async {
            if let authNV = self.taskListViewController.storyboard?.instantiateViewController(withIdentifier: Constants.ControllerId.authNV) as? UINavigationController{
                XCTAssertNotNil(authNV)
                if let keyWindow = UIWindow.key {
                    XCTAssertNotNil(keyWindow)
                    keyWindow.rootViewController = authNV
                }
            }
        }
    }
    
    func getTaskData(){
        taskViewModel.getTaskData(viewController: taskListViewController) { taskdata in
            XCTAssertNotNil(taskdata)
            XCTAssertNotNil(taskdata.data)
            XCTAssertNotEqual(0, taskdata.count)
        }
    }
    
    
}
