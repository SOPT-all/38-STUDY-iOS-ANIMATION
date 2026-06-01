//
//  InfinityCarouselView.swift
//  Animation-SeungHee
//
//  Created by 초긍정행운의포춘쿠키 on 6/1/26.
//

import UIKit

import SnapKit
import Then

final class InfinityCarouselView: UIViewController {

    // 이미 네가 무한 캐러셀용으로 맞춰둔 배열입니다.
    // 첫 번째 .milk는 "가짜 마지막", 마지막 .miku는 "가짜 첫 번째" 역할을 합니다.
    // 그래서 실제 첫 화면은 index 0이 아니라 index 1(.miku)부터 보여줘야 합니다.
    private let imageArray: [UIImage] = [.milk, .miku, .me, .milk, .miku]

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeFlowLayout()
    ).then {
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.isPagingEnabled = true
        $0.decelerationRate = .fast
        $0.dataSource = self
        $0.delegate = self
        $0.register(
            InfinityCarouselViewCell.self,
            forCellWithReuseIdentifier: InfinityCarouselViewCell.identifier
        )
    }

    private var didSetInitialOffset = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if didSetInitialOffset == false {
            didSetInitialOffset = true

            // 인덱스 0은 가짜 마지막 이미지입니다.
            // 그래서 처음 화면은 인덱스 1, 즉 진짜 첫 번째 이미지로 맞춥니다.
            collectionView.setContentOffset(
                CGPoint(x: collectionView.bounds.width, y: 0),
                animated: false
            )
        }
    }

    private func setUI() {
        view.addSubview(collectionView)
    }

    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(360)
        }
    }

    private func makeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }

    private func moveToRealImageIfNeeded(_ scrollView: UIScrollView) {
        let cellWidth = scrollView.bounds.width

        guard cellWidth > 0 else { return }

        let currentIndex = Int(round(scrollView.contentOffset.x / cellWidth))

        if currentIndex == 0 {
            // 왼쪽 가짜 셀에 도착하면 진짜 마지막 이미지 위치로 순간 이동합니다.
            let lastRealIndex = imageArray.count - 2
            scrollView.setContentOffset(
                CGPoint(x: CGFloat(lastRealIndex) * cellWidth, y: 0),
                animated: false
            )
        } else if currentIndex == imageArray.count - 1 {
            // 오른쪽 가짜 셀에 도착하면 진짜 첫 번째 이미지 위치로 순간 이동합니다.
            scrollView.setContentOffset(
                CGPoint(x: cellWidth, y: 0),
                animated: false
            )
        }
    }
}

extension InfinityCarouselView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        imageArray.count
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

        cell.bind(image: imageArray[indexPath.item])
        return cell
    }
}

extension InfinityCarouselView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        moveToRealImageIfNeeded(scrollView)
    }
}

extension InfinityCarouselView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(
            width: collectionView.bounds.width,
            height: collectionView.bounds.height
        )
    }
}
