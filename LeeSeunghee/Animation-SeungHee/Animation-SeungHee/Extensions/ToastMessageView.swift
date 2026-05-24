//
//  ToastMessageView().swift
//  Animation-SeungHee
//
//  Created by 초긍정행운의포춘쿠키 on 5/3/26.
//

import UIKit
import SnapKit
import Then

final class ToastMessageView: UIView {
    
    private let label = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .purple
        self.layer.cornerRadius = 8
        
        self.addSubview(label)
        
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
    
    func setText(_ text: String) {
        label.text = text
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
