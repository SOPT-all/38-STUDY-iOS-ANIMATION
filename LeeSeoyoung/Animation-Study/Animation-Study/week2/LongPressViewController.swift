//
//  LongPressViewController.swift
//  Animation-Study
//
//  Created by Seoyoung Lee on 5/25/26.
//

import UIKit

import SnapKit
import Then

class LongPressViewController: UIViewController {
    
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
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        jokebear.addGestureRecognizer(longPressGesture)
    }
    
    @objc private func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        if let target = gesture.view {
            target.shakeButton()
        }
    }
}
