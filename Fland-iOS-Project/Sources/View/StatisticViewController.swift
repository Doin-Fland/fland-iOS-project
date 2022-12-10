//
//  StatisticViewController.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/12/10.
//

import UIKit
import SnapKit

import UIKit

class StatisticViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Initialize
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Lifecycle
extension StatisticViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Actions
extension StatisticViewController {
    
}

// MARK: - Helpers
extension StatisticViewController {
    
    func setupLayout() {
        view.backgroundColor = .blue
    }
}

