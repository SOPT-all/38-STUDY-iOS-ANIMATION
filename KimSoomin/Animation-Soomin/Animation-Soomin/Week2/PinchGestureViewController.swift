//
//  PinchGestureViewController.swift
//  Animation-Soomin
//
//  Created by mandoo on 5/4/26.
//

import UIKit

import SnapKit
import Then

final class PinchGestureViewController: UIViewController {
    private let maengoo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setAction()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        maengoo.do {
            $0.image = .maengoo
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = true
        }
    }
    
    private func setUI() {
        view.addSubviews(maengoo)
    }
    
    private func setLayout() {
        maengoo.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
    
    private func setAction() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        maengoo.addGestureRecognizer(pinchGesture)
    }
    
    @objc private func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        if let target = gesture.view {
            target.transform = target.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1.0
        }
    }
}
