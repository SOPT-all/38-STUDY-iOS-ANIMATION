//
//  TransformViewController.swift
//  Animation-Soomin
//
//  Created by mandoo on 4/27/26.
//


import UIKit

import SnapKit
import Then

final class TransformViewController: UIViewController {
    private let mandoo = UIImageView()
    private let transformButton = UIButton()
    private let rotateButton = UIButton()
    private let biggerButton = UIButton()
    private let smallerButton = UIButton()
    private let resetButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
        view.addSubviews(mandoo, transformButton, rotateButton, biggerButton, smallerButton, resetButton)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        mandoo.do {
            $0.image = .mandoo
            $0.contentMode = .scaleAspectFit
        }
        
        [transformButton, rotateButton, biggerButton, smallerButton, resetButton].forEach {
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .systemBlue
        }
        
        transformButton.setTitle("움직이기", for: .normal)
        rotateButton.setTitle("회전시키기", for: .normal)
        biggerButton.setTitle("커지게하기", for: .normal)
        smallerButton.setTitle("작게하기", for: .normal)
        resetButton.setTitle("리셋", for: .normal)
        resetButton.backgroundColor = .systemGray
    }
    
    private func setLayout() {
        mandoo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.size.equalTo(100)
        }
        
        resetButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(50)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        smallerButton.snp.makeConstraints {
            $0.bottom.equalTo(resetButton.snp.top).offset(-10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        biggerButton.snp.makeConstraints {
            $0.bottom.equalTo(smallerButton.snp.top).offset(-10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        transformButton.snp.makeConstraints {
            $0.bottom.equalTo(biggerButton.snp.top).offset(-10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        rotateButton.snp.makeConstraints {
            $0.bottom.equalTo(transformButton.snp.top).offset(-10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        transformButton.addTarget(self, action: #selector(transformDidTap), for: .touchUpInside)
        rotateButton.addTarget(self, action: #selector(rotateDidTap), for: .touchUpInside)
        biggerButton.addTarget(self, action: #selector(biggerDidTap), for: .touchUpInside)
        smallerButton.addTarget(self, action: #selector(smallerDidTap), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetDidTap), for: .touchUpInside)
    }
}

extension TransformViewController {
    @objc private func transformDidTap() {
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4) {
                self.mandoo.transform = CGAffineTransform(translationX: 150, y: 0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4) {
                self.mandoo.transform = CGAffineTransform(translationX: 150, y: 150)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4) {
                self.mandoo.transform = CGAffineTransform(translationX: 0, y: 150)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4) {
                self.mandoo.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        }
    }
    
    @objc private func rotateDidTap() {
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4) {
                self.mandoo.transform = self.mandoo.transform.rotated(by: .pi / 4)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4) {
                self.mandoo.transform = self.mandoo.transform.rotated(by: .pi / 4)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4) {
                self.mandoo.transform = self.mandoo.transform.rotated(by: .pi / 4)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4) {
                self.mandoo.transform = self.mandoo.transform.rotated(by: .pi / 4)
            }
        }
    }
    
    @objc private func biggerDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.mandoo.transform = self.mandoo.transform.scaledBy(x: 1.2, y: 1.2)
        }
    }
    
    @objc private func smallerDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.mandoo.transform = self.mandoo.transform.scaledBy(x: 0.8, y: 0.8)
        }
    }
    
    @objc private func resetDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.mandoo.transform = .identity
        }
    }
}
