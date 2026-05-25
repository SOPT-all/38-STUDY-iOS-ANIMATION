//
//  SwipeGestureViewController.swift
//  seoyeonAssignment
//
//  Created by 신서연 on 5/25/26.
//


import UIKit

import SnapKit
import Then

final class SwipeGestureViewController: UIViewController {

    // MARK: - UI

    private let imageView = UIImageView().then {
        $0.image = UIImage(named: "ganadi1")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }

    // MARK: - 라이프싸이클

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        setGesture()
    }
}

// MARK: - 셋업

private extension SwipeGestureViewController {

    func setStyle() {
        view.backgroundColor = .white
    }

    func setUI() {
        view.addSubview(imageView)
    }

    func setLayout() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(220)
        }
    }

    func setGesture() {

        let leftSwipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(handleSwipe(_:))
        )

        leftSwipe.direction = .left

        let rightSwipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(handleSwipe(_:))
        )

        rightSwipe.direction = .right

        imageView.addGestureRecognizer(leftSwipe)
        imageView.addGestureRecognizer(rightSwipe)
    }
}

// MARK: - Action

private extension SwipeGestureViewController {

    @objc
    func handleSwipe(_ gesture: UISwipeGestureRecognizer) {

        switch gesture.direction {

        case .left:

            UIView.animate(withDuration: 0.1) {
                self.imageView.center.x -= 100
            } completion: { _ in
                self.imageView.image = UIImage(named: "swipeGanadi2")
            }

        case .right:

            UIView.animate(withDuration: 0.1) {
                self.imageView.center.x += 100
            } completion: { _ in
                self.imageView.image = UIImage(named: "swipeGanadi1")
            }

        default:
            break
        }
    }
}
