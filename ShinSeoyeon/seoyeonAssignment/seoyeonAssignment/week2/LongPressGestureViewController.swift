//
//  LongPressGestureViewController.swift
//  seoyeonAssignment
//
//  Created by 신서연 on 5/25/26.
//

import UIKit

import SnapKit
import Then

final class LongPressGestureViewController: UIViewController {

    // MARK: - UI

    private let imageView = UIImageView().then {
        $0.image = UIImage(named: "longpressGanadi1")
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

private extension LongPressGestureViewController {

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
        let longPressGesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(handleLongPress(_:))
        )

        longPressGesture.minimumPressDuration = 0.3 // 최소 프레스해야되는 시간

        imageView.addGestureRecognizer(longPressGesture)
    }
}

// MARK: - 액션

private extension LongPressGestureViewController {

    @objc
    func handleLongPress(_ gesture: UILongPressGestureRecognizer) {

        switch gesture.state {

        case .began:
            UIView.animate(withDuration: 0.1) {
                self.imageView.image = UIImage(named: "longpressGanadi2")
            }

        case .ended, .cancelled:
            UIView.animate(withDuration: 0.1) {
                self.imageView.image = UIImage(named: "longpressGanadi1")
                self.imageView.transform = .identity
            }

        default:
            break
        }
    }
}
