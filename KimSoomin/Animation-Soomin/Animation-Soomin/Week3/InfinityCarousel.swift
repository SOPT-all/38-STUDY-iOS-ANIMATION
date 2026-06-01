//
//  InfinityCarousel.swift
//  Animation-Soomin
//
//  Created by mandoo on 5/25/26.
//

import UIKit

import SnapKit
import Then

final class InfinityCarousel: UIViewController {
    private let imageArray: [UIImage] = [
        .carousel5,
        .carousel1, .carousel2, .carousel3, .carousel4, .carousel5,
        .carousel1
    ]
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setStyle()
        setCollectionViewLayout()
    }
    
    override func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
       self.collectionView.setContentOffset(.init(x: 500, y: 0), animated: false)
   }
    
    private func setUI() {
        view.backgroundColor = .white
        self.view.addSubviews(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(500)
        }
    }
    
    private func setStyle() {
        collectionView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.isPagingEnabled = true
        }
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(InfinityCarouselViewCell.self, forCellWithReuseIdentifier: InfinityCarouselViewCell.identifier)
    }
    
    private func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 500, height: 500)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension InfinityCarousel: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = 500.0
        if scrollView.contentOffset.x == 0 {
            let offsetX = CGFloat(self.imageArray.count - 2) * width
            scrollView.setContentOffset(.init(x: offsetX, y: 0), animated: false)
        }
        else if scrollView.contentOffset.x == CGFloat(self.imageArray.count - 1) * width {
            let offsetX = width
            scrollView.setContentOffset(.init(x: offsetX, y: 0), animated: false)
        }
    }
}

extension InfinityCarousel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfinityCarouselViewCell.identifier, for: indexPath) as? InfinityCarouselViewCell else {
            return UICollectionViewCell()
        }
        
        cell.bind(image: imageArray[indexPath.item])
        return cell
    }
}
