//
//  TosteMessageViewController.swift
//  Animation-Seryung
//
//  Created by 김세령 on 5/4/26.
//

import UIKit

import SnapKit
import Then

final class ToastMessageViewController: UIViewController {
    
    // MARK: - UI
    
    private let imageView = UIImageView()
    private let clickButton = UIButton()
    
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
        
        clickButton.do {
            $0.setTitle("눌러보세요~!!", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
    
    func setUI() {
        view.addSubview(imageView)
        view.addSubview(clickButton)
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.width.equalTo(200)
            $0.height.equalTo(140)
        }
        
        clickButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    // MARK: - Action
    
    func setAction() {
        clickButton.addTarget(self, action: #selector(clickButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func clickButtonDidTap() {
        showToast("토스트 메세지 등장")
    }
    
    // MARK: - Toast
    
    func showToast(_ title: String) {
        let toastLabel = UILabel()
        
        view.addSubview(toastLabel)
        
        toastLabel.do {
            $0.text = title
            $0.textColor = .white
            $0.backgroundColor = UIColor.black.withAlphaComponent(0.75)
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.layer.cornerRadius = 14
            $0.clipsToBounds = true
            $0.alpha = 1
        }
        
        toastLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(clickButton.snp.top).offset(-30)
            $0.height.equalTo(45)
            $0.width.greaterThanOrEqualTo(170)
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 2.0,
                       options: .curveEaseOut) {
            toastLabel.alpha = 0
        } completion: { _ in
            toastLabel.removeFromSuperview()
        }
    }
}
