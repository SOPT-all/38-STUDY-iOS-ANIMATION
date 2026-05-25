//
//  LongPressViewConroller.swift
//  Sopt-Animate
//
//  Created by 성환 on 5/25/26.
//

import UIKit

import SnapKit
import Then

class LongPressViewConroller: BaseUIViewController {
    // MARK: - UI
    
    private let gamjaImage = UIImageView(image: .gamja)
    
    // MARK: - Layout
    
    override func setUp() {
        view.addSubviews(gamjaImage)
    }
    
    override func setLayout() {
        gamjaImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(240)
        }
    }

    // MARK: - Action

    override func setAction() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPress.minimumPressDuration = 0.3
        gamjaImage.addGestureRecognizer(longPress)
        gamjaImage.isUserInteractionEnabled = true
    }

    @objc private func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .curveLinear]) {
                self.gamjaImage.transform = self.gamjaImage.transform.rotated(by: .pi)
            }
        case .ended, .cancelled:
            gamjaImage.layer.removeAllAnimations()
            gamjaImage.transform = .identity
        default:
            break
        }
    }
}
