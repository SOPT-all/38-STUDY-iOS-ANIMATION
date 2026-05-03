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
        
        setUp()
        register()
        setLayout()
        setAction()
        setDelegate()
    }
    
    func setUp() {}
    
    func register() {}
    
    func setLayout() {}
    
    func setAction() {}
    
    func setDelegate() {}
}
