//
//  SummaryViewController.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2022/12/19.
//

import UIKit
import SnapKit


class SummaryViewController: UIViewController {
    // TODO: 드롭다운 버튼 우측에 추가 필요함.
    private let calanderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("2022년 11월", for: .normal)
        button.titleLabel?.font = .spoqa(13, .regular)
        button.setTitleColor(ColorSet.grey_1000, for: .normal)
        return button
    }()
    
    private let netProfitLabel: UILabel = {
        let label = UILabel()
        label.text = "순이익"
        label.textColor = ColorSet.grey_600
        label.font = UIFont.spoqa(13, .medium)
        return label
    }()
    
    private let balanceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "1,234,567원"
        lb.textColor = .black
        lb.font = UIFont.spoqa(20, .bold)
        return lb
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [
            self.impendingTaskContainerView,
            self.myTaskContainerView,
            self.expenditureContainerView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    private let impendingTaskContainerView = ImpendingTaskView()
    
    private let myTaskContainerView = MyTaskView()
    
    private let expenditureContainerView = ExpenditureTaskView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
    }
    
    func layout() {
        let indicatorViewContainer = UIView()
        view.addSubview(indicatorViewContainer)
        
        [
            calanderButton, netProfitLabel, balanceLabel
        ].forEach { indicatorViewContainer.addSubview($0) }
        
        let sidePadding = 16
        indicatorViewContainer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(sidePadding)
            make.right.equalToSuperview().inset(sidePadding)
            make.height.equalTo(60)
        }
        
        calanderButton.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        netProfitLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(balanceLabel.snp.left).offset(-9)
        }
        
        impendingTaskContainerView.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(indicatorViewContainer.snp.bottom)
            make.left.equalTo(indicatorViewContainer.snp.left)
            make.right.equalTo(indicatorViewContainer.snp.right)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func attribute() {
        
    }
    
}

//class SummaryViewController: UIViewController {
//    // MARK: - Properties
//    private var collectionView: SummaryCollectionView!
//
//    private enum CollectionViewCategory: CaseIterable {
//        case netProfit
//        case currentTask
//        case myTask
//        case expense
//        case refund
//    }
//
//
//    // dummy
//    private let data = DummyData()
//
//    // TODO: UIView Subclass 로 구성할 것
//    private let calanderButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("2022년 11월", for: .normal)
//        return button
//    }()
//
//    private let netProfitLabel: UILabel = {
//        let lb = UILabel()
//        lb.text = "순이익"
//        lb.textColor = .black
//        lb.font = UIFont.spoqa(13, .bold)
//        return lb
//    }()
//
//
//}
//
//// MARK: - View Lifecycle
//extension SummaryViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupLayout()
//    }
//}
//
//// MARK: - Actions
//extension SummaryViewController {
//
//}
//
//// MARK: - Helpers
//extension SummaryViewController {
//
//    func setupLayout() {
//        view.backgroundColor = .red
//        configureCollectionView()
//        registerCollectionView()
//        collectionViewDelegate()
//        view.addSubview(collectionView)
//        collectionView.snp.makeConstraints { make in
//            make.edges.equalTo(view)
//        }
//    }
//
//    func configureCollectionView() {
//        collectionView = SummaryCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
//        collectionView.backgroundColor = .white
//        self.view.addSubview(collectionView)
//        collectionView.snp.makeConstraints { make in
//            make.edges.equalTo(view)
//        }
//    }
//
//    func registerCollectionView() {
//        collectionView.register(
//            SummaryCollectionViewCell.classForCoder(),
//            forCellWithReuseIdentifier: "cellIdentifier"
//        )
//    }
//
//    func collectionViewDelegate() {
//        collectionView.delegate = self
//        collectionView.dataSource = self
//    }
//}
//
//// MARK: - CollectionView Protocol
//extension SummaryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let category = CollectionViewCategory.allCases[indexPath.item]
//        switch category {
//        case .refund:
//                return CGSize(width: 120, height: 120)
//            default:
//            return CGSize(width: 120, height: 120)
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return CollectionViewCategory.allCases.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! SummaryCollectionViewCell
//                cell.memberNameLabel.text = data.memberName[indexPath.row]
//        return cell
//    }
//
//}
