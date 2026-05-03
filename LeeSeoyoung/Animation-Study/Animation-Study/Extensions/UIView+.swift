//
//  UIView+.swift
//  Animation-Study
//
//  Created by Seoyoung Lee on 5/4/26.
//

import UIKit

import SnapKit

extension UIView {
    func showToast(title: String) {
        let toastMessageView = UIView()
        toastMessageView.backgroundColor = .systemPink
        toastMessageView.layer.cornerRadius = 8
        
        let label = UILabel()
        label.text = title
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .medium)
        
        self.addSubview(toastMessageView)
        toastMessageView.addSubview(label)
        
        toastMessageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(35)
        }
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        UIView.animate(withDuration: 2) {
            toastMessageView.alpha = 0
        } completion: { _ in
            toastMessageView.removeFromSuperview()
        }
    }
}
