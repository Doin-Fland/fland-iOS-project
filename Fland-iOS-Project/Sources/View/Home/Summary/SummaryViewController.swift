//
//  SummaryViewController.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/12/19.
//

import UIKit
import SnapKit

class SummaryViewController: UIViewController {
    // MARK: - Properties
    private var collectionView: SummaryCollectionView!
    
    private enum CollectionViewCategory: CaseIterable {
        case netProfit
        case currentTask
        case myTask
        case expense
        case refund
    }
    
    
    // dummy
    private let data = DummyData()
    
    // TODO: UIView Subclass 로 구성할 것
    private let calanderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("2022년 11월", for: .normal)
        return button
    }()
    
    private let netProfitLabel: UILabel = {
        let lb = UILabel()
        lb.text = "순이익"
        lb.textColor = .black
        lb.font = UIFont.spoqa(13, .bold)
        return lb
    }()
    
    
}

// MARK: - View Lifecycle
extension SummaryViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Actions
extension SummaryViewController {
    
}

// MARK: - Helpers
extension SummaryViewController {
    
    func setupLayout() {
        view.backgroundColor = .red
        configureCollectionView()
        registerCollectionView()
        collectionViewDelegate()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func configureCollectionView() {
        collectionView = SummaryCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.backgroundColor = .white
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func registerCollectionView() {
        collectionView.register(SummaryCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellIdentifier")
    }
        
    func collectionViewDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - CollectionView Protocol
extension SummaryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let category = CollectionViewCategory.allCases[indexPath.item]
        switch category {
        case .refund:
                return CGSize(width: 120, height: 120)
            default:
            return CGSize(width: 120, height: 120)
        }
        
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionViewCategory.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! SummaryCollectionViewCell
                cell.memberNameLabel.text = data.memberName[indexPath.row]
        return cell
    }
    
}
