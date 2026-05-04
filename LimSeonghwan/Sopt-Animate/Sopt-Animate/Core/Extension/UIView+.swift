//
//  UIView+.swift
//  Sopt-Practice
//
//  Created by 성환 on 4/22/26.
//

import UIKit
import SnapKit
import Then

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    func showToast(title: String) {
        let toastMessageView = ToastMessageView(title: title)
        self.addSubview(toastMessageView)
        
        toastMessageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(50)
        }
        toastMessageView.layer.cornerRadius = 8
        
        UIView.animate(withDuration: 1.5) {
            toastMessageView.alpha = 0
        } completion: { _ in
            toastMessageView.removeFromSuperview()
        }
    }
}
