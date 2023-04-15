//
//  MyTaskHeaderView.swift
//  Fland-iOS-Project
//
//  Created by MIN SEONG KIM on 2023/04/15.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class MyTaskHeaderView: UIViewController {
    //MARK: - Properties
    private let disposeBag = DisposeBag()

    private lazy var dateStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dateLabel, downImage])
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2022년 11월"
        label.font = .spoqa(13, .regular)
        label.textColor = ColorSet.grey_1000
        return label
    }()
    
    private let downImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "arrow_drop_down")?.withTintColor(ColorSet.grey_600!, renderingMode: .alwaysOriginal))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let datePicker: UIPickerView = {
        let datePicker = UIPickerView()
        return datePicker
    }()
    
    private let incomeLabel: UILabel = {
        let label = UILabel()
        label.text = "이번 달 수익은\n1,234,567원이예요"
        label.font = .spoqa(18, .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var incomeAnalysisButton: TitleInsetsButton = {
        let button = TitleInsetsButton()
        button.setTitle("수익 분석", for: .normal)
        button.titleLabel?.font = .spoqa(12, .bold)
        button.titleEdgeInsets = UIEdgeInsets(top: 8, left: 14, bottom: 8, right: 14)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorSet.grey_100
        return view
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        rxActionSetup()
    }
    
    //MARK: - Action
    private func rxActionSetup() {
        dateStackView.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                print("tapGesture: stackView")
            }
            .disposed(by: disposeBag)
        
        incomeAnalysisButton.rx.tap
            .bind { [weak self] in
                print("incomeAnalysisButton tap")
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: - Helpers
    private func setupLayout() {
        view.addSubview(dateStackView)
        view.addSubview(incomeLabel)
        view.addSubview(incomeAnalysisButton)
        view.addSubview(lineView)

        dateStackView.snp.makeConstraints { make in
            make.top.leading.equalTo(view).inset(16)
            make.height.equalTo(24)
        }
        
        incomeLabel.snp.makeConstraints { make in
            make.top.equalTo(dateStackView.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
        }
        
        incomeAnalysisButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalTo(incomeLabel.snp.centerY)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(incomeLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(8)
        }
    }
}
