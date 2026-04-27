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
    
    private let mandoo = UIImageView().then {
        $0.image = .mandoo
        $0.isUserInteractionEnabled = true
    }
    
    
    func setUI() {
        view.addSubviews(mandoo)
    }
    
    func setLayout() {
        
        mandoo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
        setLayout()
        
    }
    
}
