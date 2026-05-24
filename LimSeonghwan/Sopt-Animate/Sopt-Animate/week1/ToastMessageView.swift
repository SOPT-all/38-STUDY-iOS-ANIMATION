//
//  ToastMessageView.swift
//  Sopt-Animate
//
//  Created by 성환 on 5/4/26.
//

import UIKit
import SnapKit
import Then

final class ToastMessageView: BaseUIView {
    // MARK: - UI
    
    private let titleLabel = UILabel().then {
        $0.textColor = .white
    }
    
    // MARK: - init

    private var title: String = ""

    init(title: String) {
        self.title = title
        super.init(frame: .zero)
    }

    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - setup

    override func setUp() {
        addSubview(titleLabel)
        titleLabel.text = title
        backgroundColor = .gray
        layer.cornerRadius = 8
    }
    
    // MARK: - layout

    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
    }
}
