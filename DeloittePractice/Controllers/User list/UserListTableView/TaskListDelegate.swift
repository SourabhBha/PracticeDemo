//
//  UserListDelegate.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation
import UIKit

class TaskListDelegate: NSObject, UITableViewDelegate{
    var tasks: TaskData?
    var userSelection: ((Datum) -> Void)?
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let task = self.tasks?.data[indexPath.row]{
            self.userSelection?(task)
        }
    }
}
