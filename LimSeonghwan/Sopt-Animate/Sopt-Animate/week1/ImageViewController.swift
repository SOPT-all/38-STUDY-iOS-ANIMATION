//
//  ImageViewController.swift
//  Sopt-Animate
//
//  Created by 성환 on 5/4/26.
//

import UIKit
import SnapKit
import Then

class ImageViewController: BaseUIViewController {
    // MARK: - UI

    private let imageView = UIImageView().then {
        $0.image = .nalmuck
    }
    
    private let buttonStack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    private let rotationButton = UIButton().then {
        $0.setTitle("회전", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemBlue
    }
    
    private let moveButton = UIButton().then {
        $0.setTitle("움직이기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemBlue
    }
    
    private let bigButton = UIButton().then {
        $0.setTitle("커지게하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemBlue
    }
    
    private let smallButton = UIButton().then {
        $0.setTitle("작게하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemBlue
    }
    
    // MARK: - setup
    
    override func setUp() {
        view.addSubviews(imageView, buttonStack)
        [rotationButton, moveButton, bigButton, smallButton].forEach { buttonStack.addArrangedSubview($0) }
    }
    
    // MARK: - Layout

    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.width.equalTo(200)
            $0.height.equalTo(140)
        }
        buttonStack.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        for item in [rotationButton, moveButton, bigButton, smallButton] {
            item.snp.makeConstraints { $0.height.equalTo(50) }
        }
    }
    
    // MARK: - Action
    
    override func setAction() {
        rotationButton.addTarget(self, action: #selector(rotationButtonDidTap), for: .touchUpInside)
        moveButton.addTarget(self, action: #selector(moveButtonDidTap), for: .touchUpInside)
        bigButton.addTarget(self, action: #selector(bigButtonDidTap), for: .touchUpInside)
        smallButton.addTarget(self, action: #selector(smallButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func rotationButtonDidTap() {
        UIView.animateKeyframes(withDuration: 2, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi/2)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi * 3/2)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.imageView.transform = .identity
            }
        }
    }
    
    @objc
    private func moveButtonDidTap() {
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(translationX: 100, y: 0)
            }
                
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(translationX: 100, y: 150)
            }
                
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(translationX: -100, y: 150)
            }
                
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(translationX: -100, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.95, relativeDuration: 0.1) {
                self.imageView.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        }
    }
    
    @objc private func bigButtonDidTap() {
        UIView.animate(withDuration: 1) {
            self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }

    @objc private func smallButtonDidTap() {
        UIView.animate(withDuration: 1) {
            self.imageView.transform = .identity
        }
    }
}
