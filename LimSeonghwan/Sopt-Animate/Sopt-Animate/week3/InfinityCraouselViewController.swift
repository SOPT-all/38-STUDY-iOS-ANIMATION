//
//  InfinityCraouselViewController.swift
//  Sopt-Animate
//
//  Created by 성환 on 6/1/26.
//

import UIKit

import SnapKit
import Then

class InfinityCarouselViewController: BaseUIViewController {
    private let imageArray: [UIImage] = [
        .image5, .image1, .image2, .image3, .image4, .image5, .image1
    ]
    private let cellWidth: CGFloat = 600
    private var hasSetInitialOffset = false

    private let layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

    override func setUp() {
        view.addSubview(collectionView)
    }

    override func register() {
        collectionView.register(
            InfinityCarouselViewCell.self,
            forCellWithReuseIdentifier: InfinityCarouselViewCell.identifier
        )
    }

    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(cellWidth)
        }
    }

    override func setStyle() {
        layout.do {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 0
            $0.itemSize = CGSize(width: cellWidth, height: 400)
        }
        collectionView.do {
            $0.isPagingEnabled = true
        }
    }

    override func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard !hasSetInitialOffset else { return }
        hasSetInitialOffset = true
        collectionView.setContentOffset(.init(x: cellWidth, y: 0), animated: false)
    }
}

extension InfinityCarouselViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: InfinityCarouselViewCell.identifier,
            for: indexPath
        ) as? InfinityCarouselViewCell else {
            return UICollectionViewCell()
        }
        cell.bind(image: imageArray[indexPath.item])
        return cell
    }
}
    
extension InfinityCarouselViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == 0 {
            let offsetX = CGFloat(self.imageArray.count - 2) * cellWidth
            scrollView.setContentOffset(.init(x: offsetX, y: 0), animated: false)
        } else if scrollView.contentOffset.x == cellWidth * CGFloat(imageArray.count - 1) {
            scrollView.setContentOffset(.init(x: cellWidth, y: 0), animated: false)
        }
    }
}
