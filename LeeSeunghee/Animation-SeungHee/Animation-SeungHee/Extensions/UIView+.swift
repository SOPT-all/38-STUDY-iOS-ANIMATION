//
//  UIView+.swift
//  Animation-SeungHee
//
//  Created by 초긍정행운의포춘쿠키 on 4/27/26.
//

import UIKit
import SnapKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0)}
    }
    
    
    func showToast(_ title: String) {
        let toastMessageView = ToastMessageView()
        toastMessageView.setText(title)
        self.addSubview(toastMessageView)
        
        toastMessageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(35)
        }
        
        toastMessageView.layer.cornerRadius = 8
        
        UIView.animate(withDuration: 1.5) {
            toastMessageView.alpha = 0
        } completion: { _ in
            toastMessageView.removeFromSuperview()
        }
    }
}
