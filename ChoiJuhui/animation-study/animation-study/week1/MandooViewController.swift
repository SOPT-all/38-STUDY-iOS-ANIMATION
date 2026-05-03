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
        $0.contentMode = .scaleAspectFit
        
    }
    
    private let spinButton = UIButton().then {
        $0.setTitle("회전하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 16
    }
    
    private let transformButton = UIButton().then {
        $0.setTitle("움직이기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 16
    }
    
    private let bigButton = UIButton().then {
        $0.setTitle("커지게하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 16
    }
    
    private let smallButton = UIButton().then {
        $0.setTitle("작게하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 16
    }
    
    private let resetButton = UIButton().then {
        $0.setTitle("리셋", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 16
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
        setAction()
    }
    
    private func setUI() {
        [mandoo, spinButton, transformButton, bigButton, smallButton, resetButton].forEach { view.addSubview($0) }
    }
    
    private func setLayout() {
        mandoo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.width.height.equalTo(200)
        }
        
        spinButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mandoo.snp.bottom).offset(100)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        transformButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(spinButton.snp.bottom).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        bigButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(transformButton.snp.bottom).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        smallButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(bigButton.snp.bottom).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        resetButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(smallButton.snp.bottom).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
    }
    
    private func setAction() {
        spinButton.addTarget(self, action: #selector(didTapSpinButton), for: .touchUpInside)
        transformButton.addTarget(self, action: #selector(didTapTransformButton), for: .touchUpInside)
        bigButton.addTarget(self, action: #selector(didTapBigButton), for: .touchUpInside)
        smallButton.addTarget(self, action: #selector(didTapSmallButton), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
    }

    @objc private func didTapSpinButton() {
        UIView.animate(withDuration: 1) {
            self.mandoo.transform = self.mandoo.transform.rotated(by: .pi)
        }
    }

    @objc private func didTapTransformButton() {
        UIView.animate(withDuration: 1) {
            self.mandoo.transform = CGAffineTransform(translationX: 100, y: 100)
        }
    }

    @objc private func didTapBigButton() {
        UIView.animate(withDuration: 1) {
            self.mandoo.transform = self.mandoo.transform.scaledBy(x: 2, y: 2)
        }
    }

    @objc private func didTapSmallButton() {
        UIView.animate(withDuration: 1) {
            self.mandoo.transform = self.mandoo.transform.scaledBy(x: 0.5, y: 0.5)
        }
    }

    @objc private func didTapResetButton() {
        UIView.animate(withDuration: 1) {
            self.mandoo.transform = .identity
        }
    }
    
}
