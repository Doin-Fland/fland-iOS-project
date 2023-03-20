//
//  MyTaskView.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2023/03/20.
//

import UIKit

class MyTaskView: UIView {
    
    private let cellTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "내 업무"
        lb.textColor = ColorSet.grey_1000
        lb.font = .spoqa(13, .regular)
        return lb
    }()
    
    private let balanceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "+123,456,789원"
        lb.textColor = ColorSet.primary_600_main
        lb.font = .spoqa(15, .bold)
        return lb
    }()
    
    private let pageIndicatorLabel: UILabel = {
        let lb = UILabel()
        lb.text = "2/3"
        lb.textColor = ColorSet.grey_600
        lb.font = .spoqa(13, .regular)
        return lb
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
        self.backgroundColor = ColorSet.grey_100
        [
            cellTitleLabel,
            balanceLabel,
            pageIndicatorLabel
        ].forEach { self.addSubview($0) }
        
        cellTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.centerY).offset(-6)
            make.left.equalToSuperview().offset(16)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.centerY).offset(6)
            make.left.equalToSuperview().offset(16)
        }
        
        pageIndicatorLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
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

