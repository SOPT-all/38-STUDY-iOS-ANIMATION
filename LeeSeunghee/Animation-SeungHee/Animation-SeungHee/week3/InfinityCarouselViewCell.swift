//
//  lotti.swift
//  Animation-SeungHee
//
//  Created by 초긍정행운의포춘쿠키 on 6/1/26.
//

import UIKit

import SnapKit
import Then


class InfinityCarouselViewCell: UICollectionViewCell {
    static let identifier: String = "InfinityCarouselViewCell"
    private let imageView = UIImageView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setStyle()
    }
    
    private func setUI() {
        contentView.addSubview(imageView)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setStyle() {
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        contentView.clipsToBounds = true
    }
    
    func bind(image: UIImage) {
        imageView.image = image
    }
}
