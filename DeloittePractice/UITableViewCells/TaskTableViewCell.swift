//
//  UsersTableViewCell.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskId: UILabel!
    
    class var storyboardID : String {
        return "\(self)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func registerUserCellXib(with tableView: UITableView){
        let nib = UINib(nibName: self.storyboardID, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: self.storyboardID)
    }
    
    func configureCell(task: Datum){
        
        self.taskName.text = task.datumDescription
        self.taskId.text = task.id
        self.selectionStyle = .none
        applyAccessibility(task: task)
    }
    
    func applyAccessibility(task: Datum){
        self.taskName.accessibilityLabel = task.datumDescription
        self.taskName.accessibilityTraits = .none
        
        self.taskId.accessibilityTraits = .none
        self.taskId.accessibilityLabel = "task id"
        
    }
}
