//
//  ToastMessageViewController.swift
//  Sopt-Animate
//
//  Created by 성환 on 5/4/26.
//

import UIKit
import SnapKit
import Then

class ToastMessageViewController: BaseUIViewController {
    // MARK: - UI
    
    private let bonobonoImage = UIImageView(image: UIImage(resource: .nalmuck))
    
    private let clickButton = UIButton().then {
        $0.setTitle("눌러보세여", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
    }
    
    private let toastMessage = UIView()
    
    // MARK: - setup
    
    override func setUp() {
        view.addSubviews(bonobonoImage,clickButton,toastMessage)
    }
    
    // MARK: - layout
    
    override func setLayout() {
        bonobonoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.width.equalTo(200)
            $0.height.equalTo(140)
        }
        clickButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        toastMessage.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - action
    
    override func setAction() {
        clickButton.addTarget(self, action: #selector(clickButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func clickButtonDidTap() {
        toastMessage.showToast(title: "토스트 메세지 등장")
    }

}
