//
//  MandooViewController.swift
//  animation-study
//
//  Created by h2e on 5/3/26.
//

import UIKit

import SnapKit
import Then

class MandooViewController: UIViewController {
    
    private let mandoo = UIImageView().then {
        $0.image = UIImage(named: "mandoo")
    }
    
    private let transformButton = UIButton().then {
        $0.setTitle("이동하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 16
        $0.addTarget(self, action: #selector(didTapTransformButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [mandoo, transformButton].forEach { view.addSubview($0) }
    }
    
    private func setLayout() {
        mandoo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
        }
        transformButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mandoo.snp.bottom).offset(100)
        }
    }
    
    @objc private func didTapTransformButton() {
        UIView.animate(withDuration: 1) {
            self.mandoo.transform = CGAffineTransform(translationX: 100, y: 100)
        }
    }
}
