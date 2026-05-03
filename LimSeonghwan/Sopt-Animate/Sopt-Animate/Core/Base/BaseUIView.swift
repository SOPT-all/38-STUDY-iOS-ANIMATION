//
//  BaseUIView.swift
//  Sopt-Watcha
//
//  Created by 성환 on 4/30/26.
//

import UIKit

class BaseUIView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUp()
        setLayout()
        setAction()
        setDelegate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {}

    func setLayout() {}
    
    func setAction() {}
    
    func setDelegate() {}
}
