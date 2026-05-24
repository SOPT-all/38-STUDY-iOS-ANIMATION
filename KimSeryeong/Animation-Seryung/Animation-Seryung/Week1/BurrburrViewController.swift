//
//  BurrburrViewController.swift
//  Animation-Seryung
//
//  Created by 김세령 on 5/4/26.
//

import UIKit

import SnapKit
import Then

final class ShakeButtonViewController: UIViewController {
    
    // MARK: - UI
    
    private let imageView = UIImageView()
    private let shakeButton = UIButton()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setAction()
    }
    
    // MARK: - Setup
    
    func setStyle() {
        view.backgroundColor = .white
        
        imageView.do {
            $0.image = UIImage(resource: .mandoo)
            $0.contentMode = .scaleAspectFit
        }
        
        shakeButton.do {
            $0.setTitle("눌러보세여", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemRed
            $0.layer.cornerRadius = 10
        }
    }
    
    func setUI() {
        view.addSubview(imageView)
        view.addSubview(shakeButton)
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.width.equalTo(200)
            $0.height.equalTo(140)
        }
        
        shakeButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    // MARK: - Action
    
    func setAction() {
        shakeButton.addTarget(self, action: #selector(shakeButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func shakeButtonDidTap() {
        shakeImageView()
    }
    
    // MARK: - Animation
    
    func shakeImageView() {
        UIView.animate(withDuration: 0.08,
                       delay: 0,
                       options: [.autoreverse, .repeat]) {
            self.imageView.transform = CGAffineTransform(translationX: 10, y: 0)
        } completion: { _ in
            self.imageView.transform = .identity
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.imageView.layer.removeAllAnimations()
            self.imageView.transform = .identity
        }
    }
}
