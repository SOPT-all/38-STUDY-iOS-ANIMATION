//
//  ToastMessageView.swift
//  animation-study
//
//  Created by h2e on 5/3/26.
//

import UIKit

import SnapKit
import Then

final class ToastMessageView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .center
    }
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        backgroundColor = UIColor.systemPink.withAlphaComponent(0.7)
        addSubview(titleLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        }
    }
}
