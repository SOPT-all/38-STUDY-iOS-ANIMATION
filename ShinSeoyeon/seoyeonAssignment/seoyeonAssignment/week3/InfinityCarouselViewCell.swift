//
//  InfinityCarouselViewCell.swift
//  seoyeonAssignment
//
//  Created by 신서연 on 6/1/26.
//

import UIKit

import SnapKit

final class InfinityCarouselViewCell: UICollectionViewCell {

    static let identifier = "InfinityCarouselViewCell"

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setUI() {
        imageView.contentMode = .scaleAspectFit

        contentView.addSubview(imageView)
    }

    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configure(image: UIImage?) {
        imageView.image = image
    }
}
