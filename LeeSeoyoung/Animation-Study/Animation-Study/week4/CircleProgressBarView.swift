//
//  CircleProgressBarView.swift
//  Animation-Study
//
//  Created by Seoyoung Lee on 6/24/26.
//

import UIKit

import SnapKit
import Then

final class CircleProgressBarView: UIView {
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(3 * Double.pi / 4)
    private var endPoint = CGFloat(Double.pi / 4)
    
    override func draw(_ rect: CGRect) {
        createCircularPath()
    }
    
    private func createCircularPath() {
        self.backgroundColor = .white
        
        let path = UIBezierPath(arcCenter: .init(x: self.frame.width / 2,
                                                 y: self.frame.height / 2),
                                radius: (frame.size.height - 10) / 2,
                                startAngle: startPoint,
                                endAngle: endPoint,
                                clockwise: true)
        
        // 회색 배경 트랙 레이어
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 3
        circleLayer.strokeEnd = 1
        circleLayer.strokeColor = UIColor.black.withAlphaComponent(0.4).cgColor
        layer.addSublayer(circleLayer)
        
        // 실시간으로 채워질 빨간색 게이지 레이어
        progressLayer.path = path.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 3
        progressLayer.strokeEnd = 0 // 처음엔 0% 상태로 대기
        progressLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(progressLayer)
    }
    
    // 외부에 있는 버튼 액션을 받아 애니메이션 실행
    func progressAnimation(duration: TimeInterval, fromValue: Double, toValue: Double) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.fromValue = fromValue
        circularProgressAnimation.toValue = toValue
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        
        progressLayer.strokeEnd = CGFloat(toValue)
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
