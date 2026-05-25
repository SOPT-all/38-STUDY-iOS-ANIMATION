//
//  BaseUIViewController.swift
//  Sopt-Watcha
//
//  Created by 성환 on 4/30/26.
//

import UIKit

class BaseUIViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUp()
        register()
        setLayout()
        setStyle()
        setAction()
        setDelegate()
    }
    
    func setUp() {}
    
    func register() {}
    
    func setLayout() {}
    
    func setStyle() {}
    
    func setAction() {}
    
    func setDelegate() {}
}
