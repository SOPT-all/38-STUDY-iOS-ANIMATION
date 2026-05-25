//
//  PanGestureViewController.swift
//  Animation-Soomin
//
//  Created by mandoo on 5/4/26.
//

import UIKit

import SnapKit
import Then

final class PanGestureViewController: UIViewController {
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
        maengoo.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        if let target = gesture.view {
            target.center = CGPoint(x: target.center.x + translation.x,
                                    y: target.center.y + translation.y)
        }
        gesture.setTranslation(.zero, in: view)
    }
}

