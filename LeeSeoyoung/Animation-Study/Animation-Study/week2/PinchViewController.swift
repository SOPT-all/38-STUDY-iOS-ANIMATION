//
//  PinchViewController.swift
//  Animation-Study
//
//  Created by Seoyoung Lee on 5/25/26.
//

import UIKit

import SnapKit
import Then

class PinchViewController: UIViewController {

    private let jokebear = UIImageView().then {
        $0.image = .jokebear
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAction()
    }
    
    private func setUI() {
        [jokebear].forEach { self.view.addSubview($0) }
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        jokebear.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(400)
        }
    }
    
    private func setAction() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        jokebear.addGestureRecognizer(pinchGesture)
    }
    
    @objc private func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        if let target = gesture.view {
            target.transform = target.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1.0
        }
    }
}
