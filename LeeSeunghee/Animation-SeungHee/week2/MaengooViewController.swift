//
//  MaengooController.swift
//  Animation-SeungHee
//
//  Created by 초긍정행운의포춘쿠키 on 5/25/26.
//

import UIKit

import SnapKit
import Then

class MaengooViewController: UIViewController {
    
    //MARK: - UI Property
    
    private let maengoo = UIImageView().then {
        $0.image = .maengoo
        $0.isUserInteractionEnabled = true
    }
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
        setAction()
    }
    
    //MARK: - UI Setting
    
   private func setUI() {
        view.addSubviews(maengoo)
    }
    
    private func setLayout() {
        maengoo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setAction() {
        maengoo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        maengoo.addGestureRecognizer(UIPanGestureRecognizer(target: self,action: #selector(handlePan)))
    }
    
    //MARK: - functions
    
    @objc private func handleTap() {
        UIView.animate(withDuration: 0.5) {
            self.maengoo.transform = self.maengoo.transform.rotated(by: .pi)
        }
    }
    
    @objc
    private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        if let target = gesture.view {
            target.center = CGPoint(x: target.center.x + translation.x, y: target.center.y + translation.y)
        }
        gesture.setTranslation(.zero, in: view)
    }
}
