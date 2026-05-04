//
//  BrrViewController.swift
//  Sopt-Animate
//
//  Created by 성환 on 5/4/26.
//

import UIKit
import SnapKit
import Then

class BrrViewController: BaseUIViewController {
    // MARK: - UI
    
    private let bonobonoImage = UIImageView(image: UIImage(resource: .nalmuck))
    
    private let brrButton = UIButton().then {
        $0.setTitle("왜이리 떨어", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
    }

    // MARK: - setup
    
    override func setUp() {
        view.addSubviews(bonobonoImage, brrButton)
    }
    
    // MARK: - layout
    
    override func setLayout() {
        bonobonoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.width.equalTo(200)
            $0.height.equalTo(140)
        }
        brrButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    // MARK: - action
    
    override func setAction() {
        brrButton.addTarget(self, action: #selector(brrButtonDidTap), for:.touchUpInside)
    }
    
    @objc
    private func brrButtonDidTap() {
        brrButton.shakeButton()
    }
}
