//
//  ToastMessageViewController.swift
//  Animation-Soomin
//
//  Created by mandoo on 4/27/26.
//


import UIKit

import SnapKit
import Then

final class ToastMessageViewController: UIViewController {
    private let mandoo = UIImageView()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
        view.addSubviews(mandoo, button)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        mandoo.do {
            $0.image = .mandoo
            $0.contentMode = .scaleAspectFit
        }
        
        button.do {
            $0.setTitle("이걸 눌러줘", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
    }
    
    private func setLayout() {
        mandoo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(40)
            $0.height.equalTo(200)
        }
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
        }
    }
    
    private func setAddTarget() {
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
}

extension ToastMessageViewController {
    @objc private func buttonDidTap() {
        view.showToast(title: "버튼이 눌렸어요 !")
    }
}

extension UIView {
    func showToast(title: String) {
        let toastMessageView = ToastMessageView(title: title)
        self.addSubview(toastMessageView)
        
        toastMessageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(35)
        }
        
        toastMessageView.layer.cornerRadius = 8
        
        UIView.animate(withDuration: 1.5) {
            toastMessageView.alpha = 0
        } completion: { _ in
            toastMessageView.removeFromSuperview()
        }
    }
}
