//
//  InfinityCarousel.swift
//  Animation-Study
//
//  Created by Seoyoung Lee on 6/1/26.
//

import UIKit

import SnapKit
import Then

class InfinityCarousel: UIViewController {

    private let imageArray: [UIImage] = [
        .carousel5,
        .carousel1, .carousel2, .carousel3, .carousel4, .carousel5,
        .carousel1
    ]

    private var cellWidth: CGFloat { view.bounds.width }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(InfinityCarouselViewCell.self, forCellWithReuseIdentifier: InfinityCarouselViewCell.identifier)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            layout.invalidateLayout()
        }

        collectionView.setContentOffset(.init(x: cellWidth, y: 0), animated: false)
    }

    private func setUI() {
        view.addSubviews(collectionView)
        self.view.backgroundColor = .white
    }

    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.snp.width)
        }
    }
}

extension InfinityCarousel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: InfinityCarouselViewCell.identifier,
            for: indexPath
        ) as? InfinityCarouselViewCell else { return UICollectionViewCell() }
        cell.bind(image: imageArray[indexPath.item])
        return cell
    }
}

extension InfinityCarousel: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == 0 {
            let offsetX = CGFloat(self.imageArray.count - 2) * cellWidth
            scrollView.setContentOffset(.init(x: offsetX, y: 0), animated: false)
        }
        else if scrollView.contentOffset.x == CGFloat(self.imageArray.count - 1) * cellWidth {
            scrollView.setContentOffset(.init(x: cellWidth, y: 0), animated: false)
        }
    }
}
