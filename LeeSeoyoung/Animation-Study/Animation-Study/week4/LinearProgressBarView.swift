//
//  LinearProgressBarView.swift
//  Animation-Study
//
//  Created by Seoyoung Lee on 6/24/26.
//

import UIKit

import SnapKit
import Then

final class LinearProgressBarView: UIView {
    private var trackLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        createLinearPath()
    }
    
    private func createLinearPath() {
        self.backgroundColor = .clear
        
        //  직선 패스 생성
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.bounds.midY))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.midY))
        
        // 회색 배경 트랙 레이어
        trackLayer.do {
            $0.path = path.cgPath
            $0.fillColor = UIColor.clear.cgColor
            $0.strokeColor = UIColor.systemGray5.cgColor
            $0.lineWidth = self.bounds.height // 뷰의 높이만큼 두께 지정 (6pt)
            $0.lineCap = .round
            $0.strokeEnd = 1
        }
        layer.addSublayer(trackLayer)
        
        // 핑크색 게이지 레이어
        progressLayer.do {
            $0.path = path.cgPath
            $0.fillColor = UIColor.clear.cgColor
            $0.strokeColor = UIColor.systemPink.cgColor
            $0.lineWidth = self.bounds.height
            $0.lineCap = .round
            $0.strokeEnd = 0.0 // 초기에 0% 채워진 상태로 대기
        }
        layer.addSublayer(progressLayer)
    }
    
    // 외부에 있는 버튼 액션을 받아 애니메이션 실행
    func progressAnimation(duration: TimeInterval, fromValue: Double, toValue: Double) {
        let linearProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        linearProgressAnimation.duration = duration
        linearProgressAnimation.fromValue = fromValue
        linearProgressAnimation.toValue = toValue
        linearProgressAnimation.fillMode = .forwards
        linearProgressAnimation.isRemovedOnCompletion = false
        
        progressLayer.strokeEnd = CGFloat(toValue)
        progressLayer.add(linearProgressAnimation, forKey: "linearProgressAnim")
    }
}
