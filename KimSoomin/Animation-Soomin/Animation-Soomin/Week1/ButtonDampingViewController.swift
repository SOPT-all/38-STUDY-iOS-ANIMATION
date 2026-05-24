//
//  ButtonDampingViewController.swift
//  Animation-Soomin
//
//  Created by mandoo on 4/27/26.
//

import UIKit

import SnapKit
import Then

final class ButtonDampingViewController: UIViewController {
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
            $0.setTitle("부르르 부르르", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        mandoo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            $0.height.equalTo(300)
        }
                
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
}

extension ButtonDampingViewController {
    @objc private func buttonDidTap() {
        button.shakeButton()
    }
}

extension UIView {
    func shakeButton() {
        self.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 1
        ) {
            self.transform = .identity
        }
    }
}
