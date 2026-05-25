//
//  TapGestureViewController.swift
//  Animation-Soomin
//
//  Created by mandoo on 5/4/26.
//

import UIKit

import SnapKit
import Then

final class TapGestureViewController: UIViewController {
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
        maengoo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc private func handleTap() {
        UIView.animate(withDuration: 0.5) {
            self.maengoo.transform = self.maengoo.transform.rotated(by: .pi)
        }
    }
}

