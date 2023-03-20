//
//  ImpendingTaskView.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2023/03/20.
//

import UIKit
import SnapKit

class ImpendingTaskView: UIView {
    // MARK: - Properties
    private let cellTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "곧 종료될 업무"
        label.font = .spoqa(13, .regular)
        label.textColor = ColorSet.grey_000
        return label
    }()
    
    private let cellTaskLabel: UILabel = {
        let label = UILabel()
        label.text = "**대학교 홍보 포스터다지안 외 1건"
        label.font = .spoqa(15, .bold)
        label.textColor = ColorSet.grey_000
        return label
    }()
    
    private let timeIndicatorLabel: UILabel = {
        let label = UILabel()
        label.text = "마감까지 0일 남았어요"
        label.font = .spoqa(15, .bold)
        label.alpha = 0.6
        label.textColor = ColorSet.grey_000
        return label
    }()
    
    private let editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("수정", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .spoqa(12, .bold)
        button.setTitleColor(ColorSet.primary_600_main, for: .normal)
        button.addCornerRadius(cornerRadius: 4)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure()
    }
    
    private func configure() {
        self.backgroundColor = ColorSet.primary_600_main
        self.addCornerRadius()
        [
            cellTitleLabel,
            cellTaskLabel,
            timeIndicatorLabel,
            editButton
        ].forEach { self.addSubview($0) }
                
        cellTaskLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalToSuperview().offset(16)
        }
        
        cellTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(cellTaskLabel.snp.top).offset(-6)
            make.left.equalToSuperview().offset(16)
        }
        
        timeIndicatorLabel.snp.makeConstraints { make in
            make.top.equalTo(cellTaskLabel.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(16)
        }
        
        self.addSubview(editButton)
        editButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(16)
            make.width.equalTo(51)
            make.height.equalTo(32)
        }
    }
    
    override func updateConstraints() {
        //set subview constraints here
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //manually set subview frames here
    }
    
}

