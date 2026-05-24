//
//  RotationViewController.swift
//  animation-study
//
//  Created by h2e on 5/24/26.
//

import UIKit

import SnapKit
import Then

class RotationViewController: UIViewController {
    
    private let maengoo = UIImageView().then {
        $0.image = UIImage(named: "maengoo")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
        setLayout()
        setAction()
    }
    
    private func setUI() {
        view.addSubview(maengoo)
    }
    
    private func setLayout() {
        maengoo.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setAction() {
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
        maengoo.addGestureRecognizer(rotationGesture)
    }
    
    @objc private func handleRotation(_ gesture: UIRotationGestureRecognizer) {
        guard let target = gesture.view else { return }
        
        target.transform = target.transform.rotated(by: gesture.rotation)
        
        gesture.rotation = 0
    }
}
