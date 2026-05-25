//
//  SwipeViewController.swift
//  animation-study
//
//  Created by h2e on 5/24/26.
//

import UIKit

import SnapKit
import Then

final class SwipeViewController: UIViewController {
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
        let directions: [UISwipeGestureRecognizer.Direction] =
            [.left, .right, .up, .down]
        
        directions.forEach { direction in
            let swipe = UISwipeGestureRecognizer(
                target: self,
                action: #selector(handleSwipe(_:))
            )
            swipe.direction = direction
            maengoo.addGestureRecognizer(swipe)
        }
    }
    
    @objc private func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        var translation: CGAffineTransform = .identity
        
        switch gesture.direction {
        case .left:
            translation = CGAffineTransform(translationX: -50, y: 0)
        case .right:
            translation = CGAffineTransform(translationX: 50, y: 0)
        case .up:
            translation = CGAffineTransform(translationX: 0, y: -50)
        case .down:
            translation = CGAffineTransform(translationX: 0, y: 50)
        default:
            return
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            gesture.view?.transform = translation
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                gesture.view?.transform = .identity
            }
        }
    }
}
