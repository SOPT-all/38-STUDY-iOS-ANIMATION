//
//  BurrBurrViewController.swift
//  Animation-Study
//
//  Created by Seoyoung Lee on 5/3/26.
//

import UIKit

import Then
import SnapKit

class BurrBurrViewController: UIViewController {
    
    private let jokebear = UIImageView().then {
        $0.image = .jokebear
        $0.contentMode = .scaleAspectFit
    }
    
    private let button = UIButton().then {
        $0.setTitle("부르르 부르르 ...", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .deepBlue
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        [jokebear, button].forEach { self.view.addSubview($0) }
    }
    
    private func setLayout() {
        jokebear.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(400)
        }
        button.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc private func buttonDidTap() {
        button.shakeButton()
    }
}
