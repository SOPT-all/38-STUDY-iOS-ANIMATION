//
//  LottiePractice.swift
//  Animation-Soomin
//
//  Created by mandoo on 5/25/26.
//


import UIKit

import SnapKit
import Then
import Lottie

final class LottiePractice: UIViewController {
    private let lottieView = LottieAnimationView(name: "cat")
    
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
