//
//  UIView+.swift
//  Animation-Soomin
//
//  Created by mandoo on 4/27/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
