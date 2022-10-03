//
//  UserListDataSource.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation
import UIKit

class TaskListDataSource: NSObject, UITableViewDataSource{
    
    var tasks: TaskData?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks?.data.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.taskTableViewCell, for: indexPath) as? TaskTableViewCell{
            guard let task = (self.tasks?.data[indexPath.row]) else{return UITableViewCell()}
            cell.configureCell(task: task)
            return cell
        }
        return UITableViewCell()
    }
    
}
