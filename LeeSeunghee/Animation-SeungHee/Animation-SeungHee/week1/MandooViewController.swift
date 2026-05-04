//
//  week1.swift
//  Animation-SeungHee
//
//  Created by 초긍정행운의포춘쿠키 on 4/27/26.
//

import Then
import UIKit
import SnapKit

class MandooViewController: UIViewController {
    
    /* private let mandoo : UIImageView = {
     let imageView = UIImageView()
     imageView.image = UIImage(named: "mandoo")
     return imageView
     }()
     */
    
    //MARK: - properties
    
    private let mainLabel = UILabel().then{
        $0.text = "절대 만두를 만져선 않되.."
        $0.textColor = .red
    }
    
    private var isClose = false
    private var isShaking = false
    
    private let mandoo = UIImageView().then {
        $0.image = .mandoo
        $0.isUserInteractionEnabled = true
    }
    
    lazy var brr = UIButton().then {
        $0.setTitle("부르르하는거볼래?", for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.addTarget(self,action:#selector(brrDidTap),for:.touchUpInside )
    }
    
 /*   private let toast = UIView().then {
        $0.backgroundColor = .purple
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }

    private let toastLabel = UILabel().then {
        $0.text = "만지지말랬지"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .center
    }*/
    //MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
        setGesture()
        
    }
    
    //MARK: - func #setting
    
    func setUI() {
        view.addSubviews(mandoo,mainLabel,brr)
    }
    
    func setLayout() {
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.centerX.equalToSuperview()
        }
        mandoo.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
        brr.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(250)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
        }
 /*       toast.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
            $0.height.equalTo(44)
        }

        toastLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }*/
    }
    
    //MARK: - func #anime
    private func setGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(comingMandoo))
        mandoo.addGestureRecognizer(tap)
    }
    
    @objc
    private func transformMandoo() {
        UIView.animate(withDuration: 1) {
            self.mandoo.transform = CGAffineTransform(translationX: 100, y: 100)
        }
    }
    
    // func 만두움직임이 () {
    // UIView.animate(withDuration:1, delay:1, options: completion:, animations: ) { self(이 클래스의).객체(만두imageView).transform = CGAffineTransform 씨지아피네..? 트랜스폼(트랜슬래이션 x:10, y:10)}
    
    @objc
    private func moveMandoo() {
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/8) {
                self.mandoo.transform = CGAffineTransform(translationX: 75, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 1/8, relativeDuration: 1/4) {
                self.mandoo.transform = CGAffineTransform(translationX: 75, y: 150)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 3/8, relativeDuration: 1/4) {
                self.mandoo.transform = CGAffineTransform(translationX: -75, y: 150)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 5/8, relativeDuration: 1/4) {
                self.mandoo.transform = CGAffineTransform(translationX: -75, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 7/8, relativeDuration: 1/8) {
                self.mandoo.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        }
    }
    // 별도의 , 나 ; 없고 그냥 UIView.animateKeyframes() { ㅁ, ㅁ, ㅁ } 연결 쭉 쭉 나열
    // ㅁ 안에 들어가는 것 : UIView.addKeyframe(withRelativeStartTime, relativeDuration) {움직임}
    
    
    @objc
    private func comingMandoo(){
        isClose.toggle()
        UIView.animate(withDuration: 1, delay: 0, options:[.curveEaseInOut]) {
            if self.isClose {
                self.mandoo.transform =
                CGAffineTransform(scaleX: 3, y: 3)
                    .rotated(by: .pi * 3)
            } else {
                self.mandoo.transform = .identity
            }
        }
    }
    
}// end of class
