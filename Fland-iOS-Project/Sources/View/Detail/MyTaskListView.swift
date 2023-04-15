//
//  MyTaskListView.swift
//  Fland-iOS-Project
//
//  Created by MIN SEONG KIM on 2023/04/15.
//

import UIKit
import RxSwift
import RxCocoa

struct Task {
    let title: String
    let category: String
    let price: String
    let endTime: String
    let ExpectedDepositDate: String
}

struct TaskModel {
    var task: [Task]
    var sectionTitle: String
}

class TaskCell: UITableViewCell {
    static let reuseIdentifier = "TaskCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
    }
    
    func configure(with task: Task) {
        
    }
}

class MyTaskListView: UIViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action
    
    //MARK: - Helpers
}
