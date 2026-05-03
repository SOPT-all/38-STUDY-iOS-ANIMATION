//
//  UIView+.swift
//  Sopt-Practice
//
//  Created by 성환 on 4/22/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
