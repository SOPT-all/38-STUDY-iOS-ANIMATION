//
//  InfinityCarouselViewController.swift
//  seoyeonAssignment
//
//  Created by 신서연 on 6/1/26.
//

import UIKit

import SnapKit

final class InfinityCarouselViewController: UIViewController {

    private let imageNames: [String] = [
        "carousel5",
        "carousel1",
        "carousel2",
        "carousel3",
        "carousel4",
        "carousel5",
        "carousel1"
    ]

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )

    private var isFirstLayout = true

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setCollectionView()
        setLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if isFirstLayout {
            collectionView.setContentOffset(
                CGPoint(x: view.frame.width, y: 0),
                animated: false
            )
            isFirstLayout = false
        }
    }

    private func setCollectionView() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }

        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(
            width: view.frame.width,
            height: 300
        )

        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(
            InfinityCarouselViewCell.self,
            forCellWithReuseIdentifier: InfinityCarouselViewCell.identifier
        )
    }

    private func setLayout() {
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
    }
}

extension InfinityCarouselViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        imageNames.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: InfinityCarouselViewCell.identifier,
            for: indexPath
        ) as? InfinityCarouselViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(
            image: UIImage(named: imageNames[indexPath.item])
        )

        return cell
    }
}

extension InfinityCarouselViewController: UICollectionViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let width = view.frame.width
        let currentX = scrollView.contentOffset.x

        if currentX == 0 {
            scrollView.setContentOffset(
                CGPoint(x: width * 5, y: 0),
                animated: false
            )
        } else if currentX == width * 6 {
            scrollView.setContentOffset(
                CGPoint(x: width, y: 0),
                animated: false
            )
        }
    }
}
