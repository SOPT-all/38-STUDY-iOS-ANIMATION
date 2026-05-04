//
//  BurrViewController.swift
//  animation-study
//
//  Created by h2e on 5/3/26.
//

import UIKit

import SnapKit
import Then

class BurrViewController: UIViewController {
    
    private let mandoo = UIImageView().then {
        $0.image = UIImage(named: "mandoo")
        $0.contentMode = .scaleAspectFit
    }
    
    private let button = UIButton().then {
        $0.setTitle("부르르", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAction()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        [mandoo, button].forEach { view.addSubview($0) }
    }
    
    private func setLayout() {
        mandoo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.width.height.equalTo(150)
        }
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mandoo.snp.bottom).offset(120)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
    }
    
    private func setAction() {
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        mandoo.shakeButton()
    }
}

extension UIView {
    func shakeButton() {
        self.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 1
        ) {
            self.transform = .identity
        }
    }
}
