//
//  LottiePractice.swift
//  Animation-Study
//
//  Created by Seoyoung Lee on 6/1/26.
//

import UIKit

import SnapKit
import Lottie

final class LottiePractice: UIViewController {
    private let lottieView = LottieAnimationView(name: "celebration")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(lottieView)
        
        lottieView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        lottieView.play()
        lottieView.loopMode = .loop
    }
}
