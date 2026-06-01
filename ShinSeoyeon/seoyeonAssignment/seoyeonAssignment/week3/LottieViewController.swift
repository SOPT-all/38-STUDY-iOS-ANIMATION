//
//  LottieViewController.swift
//  seoyeonAssignment
//
//  Created by 신서연 on 6/1/26.
//

import UIKit

import Lottie
import SnapKit

final class LottiePracticeViewController: UIViewController {
    
    private let lottieView = LottieAnimationView(name: "lottie")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(lottieView)
        
        lottieView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(300)
        }
        
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .loop
        lottieView.play()
    }
}
