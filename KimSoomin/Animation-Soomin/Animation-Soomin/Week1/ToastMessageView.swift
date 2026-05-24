//
//  ToastMessageView.swift
//  Animation-Soomin
//
//  Created by mandoo on 4/27/26.
//


import UIKit

import SnapKit
import Then

final class ToastMessageView: UIView {
    
    private let titleLabel = UILabel()
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLayout() {
        self.backgroundColor = .systemPurple
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
        }
    }
}
