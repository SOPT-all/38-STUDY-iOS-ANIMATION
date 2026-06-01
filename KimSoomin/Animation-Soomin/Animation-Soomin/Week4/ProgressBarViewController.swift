//
//  ProgressBarViewController.swift
//  Animation-Soomin
//
//  Created by mandoo on 6/1/26.
//

import UIKit

import SnapKit
import Then

final class ProgressBarViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let linearProgressView = LinearProgressBarView()
    private let progressView = CircleProgressBarView()
    private let nextButton = UIButton()
    
    // MARK: - Properties
    
    private var currentProgress: Double = 0.0
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
        setLayout()
        setStyle()
        setAddTarget()
    }
    
    // MARK: - Set UI & Layout
    
    private func setUI() {
        self.view.addSubviews(linearProgressView, progressView, nextButton)
    }
    
    private func setLayout() {
        linearProgressView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(6)
        }
        
        progressView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(80)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(44)
        }
    }
    
    private func setStyle() {
        nextButton.do {
            $0.setTitle("다음", for: .normal)
            $0.setTitleColor(.label, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        }
    }
    
    private func setAddTarget() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Action
    
    @objc private func nextButtonTapped() {
        guard currentProgress < 1.0 else { return }
        
        let previousProgress = currentProgress
        currentProgress += 0.2 // 버튼 클릭 시 20%씩 증가
        
        // 최대값 1.0
        if currentProgress > 1.0 { currentProgress = 1.0 }
        
        linearProgressView.progressAnimation(duration: 0.5, fromValue: previousProgress, toValue: currentProgress)
        progressView.progressAnimation(duration: 0.5, fromValue: previousProgress, toValue: currentProgress)
    }
}
