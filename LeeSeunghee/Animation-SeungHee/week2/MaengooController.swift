//
//  MaengooController.swift
//  Animation-SeungHee
//
//  Created by 초긍정행운의포춘쿠키 on 5/25/26.
//

import UIKit

import SnapKit
import Then

class MaengooViewController: UIViewController {
    
    private let maengoo = UIImageView().then {
        $0.image = .maengoo
        $0.isUserInteractionEnabled = true
    }
    
}
