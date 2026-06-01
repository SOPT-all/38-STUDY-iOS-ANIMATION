//
//  LottieView.swift
//  Sopt-Animate
//
//  Created by 성환 on 6/1/26.
//

import UIKit

import Lottie
import SnapKit

class LottieView: BaseUIViewController {
    private let lottieView = LottieAnimationView(name: "slime")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lottieView)
        
        lottieView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        lottieView.loopMode = .loop
        lottieView.play()
    }
}
