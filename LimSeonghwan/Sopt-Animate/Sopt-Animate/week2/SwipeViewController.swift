//
//  SwipeViewController.swift
//  Sopt-Animate
//
//  Created by 성환 on 5/25/26.
//

import UIKit

import SnapKit
import Then

class SwipeViewController: BaseUIViewController {

    // MARK: - Properties

    private let images: [UIImage?] = [.gamja, .gamja2, .insaeng]
    private var currentIndex = 0

    // MARK: - UI

    private let cardView = UIImageView()

    // MARK: - Layout

    override func setUp() {
        view.addSubview(cardView)
    }

    override func setLayout() {
        cardView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(240)
        }
    }
    
    override func setStyle() {
        cardView.do {
            $0.image = images[currentIndex]
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = true
        }
    }

    // MARK: - Action

    override func setAction() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = .right

        cardView.addGestureRecognizer(swipeLeft)
        cardView.addGestureRecognizer(swipeRight)
    }

    @objc private func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        let direction: CGFloat = gesture.direction == .left ? 1 : -1

        UIView.animate(withDuration: 0.3, animations: {
            self.cardView.transform = CGAffineTransform(translationX: direction * -self.view.bounds.width * 1.5, y: 0)
        }, completion: { _ in
            self.currentIndex = (self.currentIndex + 1) % self.images.count
            self.cardView.image = self.images[self.currentIndex]
            self.cardView.transform = CGAffineTransform(translationX: direction * self.view.bounds.width * 1.5, y: 0)
            UIView.animate(withDuration: 0.3) {
                self.cardView.transform = .identity
            }
        })
    }
}
