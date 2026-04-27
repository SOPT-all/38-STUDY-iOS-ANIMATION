//
//  UIView+.swift
//  Animation-SeungHee
//
//  Created by 초긍정행운의포춘쿠키 on 4/27/26.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0)}
    }
}
