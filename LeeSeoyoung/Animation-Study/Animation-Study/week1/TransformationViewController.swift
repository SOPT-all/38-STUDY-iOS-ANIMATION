//
//  TransformationViewController.swift
//  Animation-Study
//
//  Created by Seoyoung Lee on 5/3/26.
//

import UIKit

import Then
import SnapKit

class TransformationViewController: UIViewController {
    
    private let jokebear = UIImageView().then {
        $0.image = .jokebear
        $0.contentMode = .scaleAspectFit
    }
    
    private let button1 = UIButton().then {
        $0.setTitle("회전해", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .deepBlue
        $0.layer.cornerRadius = 10
    }
    private let button2 = UIButton().then {
        $0.setTitle("움직여", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .deepBlue
        $0.layer.cornerRadius = 10
    }
    private let button3 = UIButton().then {
        $0.setTitle("커져라", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .deepBlue
        $0.layer.cornerRadius = 10
    }
    private let button4 = UIButton().then {
        $0.setTitle("작아져라", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .deepBlue
        $0.layer.cornerRadius = 10
    }
    private let button5 = UIButton().then {
        $0.setTitle("리셋!!", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .gray
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
        [jokebear, button1, button2, button3, button4, button5].forEach { self.view.addSubview($0) }
    }
    
    private func setLayout() {
        let halfHeight = view.frame.height / 2
        jokebear.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }
        button1.snp.makeConstraints {
            $0.top.equalTo(halfHeight+50)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        button2.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        button3.snp.makeConstraints {
            $0.top.equalTo(button2.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        button4.snp.makeConstraints {
            $0.top.equalTo(button3.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        button5.snp.makeConstraints {
            $0.top.equalTo(button4.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        button1.addTarget(self, action: #selector(button1DidTap), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2DidTap), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3DidTap), for: .touchUpInside)
        button4.addTarget(self, action: #selector(button4DidTap), for: .touchUpInside)
        button5.addTarget(self, action: #selector(button5DidTap), for: .touchUpInside)
    }
    
    @objc private func button1DidTap() {
        
    }
    
    @objc private func button2DidTap() {
        
    }
    
    @objc private func button3DidTap() {
        
    }
    
    @objc private func button4DidTap() {
        
    }
    
    @objc private func button5DidTap() {
        
    }
}
