//
//  ToastViewController.swift
//  animation-study
//
//  Created by h2e on 5/3/26.
//

import UIKit

import SnapKit
import Then

class ToastViewController: UIViewController {
    
    private let mandoo = UIImageView().then {
        $0.image = UIImage(named: "mandoo")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setGesture()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(mandoo)
    }
    
    private func setLayout() {
        mandoo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.width.height.equalTo(150)
        }
    }
    
    private func setGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapMandoo))
        mandoo.addGestureRecognizer(tap)
    }
    
    @objc private func didTapMandoo() {
        view.showToast(title: "만두 🥟")
    }
}

extension UIView {
    func showToast(title: String) {
        let toastMessageView = ToastMessageView(title: title)
        toastMessageView.alpha = 0
        toastMessageView.layer.cornerRadius = 16
        toastMessageView.clipsToBounds = true
        
        self.addSubview(toastMessageView)
        
        toastMessageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(50)
            $0.height.equalTo(35)
        }
        
        UIView.animate(withDuration: 0.3) {
            toastMessageView.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.0) {
                toastMessageView.alpha = 0
            } completion: { _ in
                toastMessageView.removeFromSuperview()
            }
        }
    }
}
