import UIKit

import SnapKit
import Then

final class InfinityCarousel: UIViewController {

    // MARK: - UI

    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )

    // MARK: - Data

    private let imageArray: [UIImage] = [
        Self.carouselImage(named: "carousel5"),
        Self.carouselImage(named: "carousel1"),
        Self.carouselImage(named: "carousel2"),
        Self.carouselImage(named: "carousel3"),
        Self.carouselImage(named: "carousel4"),
        Self.carouselImage(named: "carousel5"),
        Self.carouselImage(named: "carousel1")
    ]

    private var didSetInitialOffset = false
    private var cellWidth: CGFloat {
        collectionView.bounds.width
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        setDelegate()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        guard !didSetInitialOffset, cellWidth > 0 else { return }
        didSetInitialOffset = true

        collectionView.setContentOffset(.init(x: cellWidth, y: 0), animated: false)
    }

    // MARK: - Setup

    private func setStyle() {
        view.backgroundColor = .white

        collectionView.do {
            $0.backgroundColor = .white
            $0.isPagingEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.decelerationRate = .fast
            $0.register(InfinityCarouselCell.self, forCellWithReuseIdentifier: InfinityCarouselCell.identifier)
        }

        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.do {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 0
            $0.minimumInteritemSpacing = 0
        }
    }

    private func setUI() {
        view.addSubview(collectionView)
    }

    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(380)
        }
    }

    private func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private static func carouselImage(named imageName: String) -> UIImage {
        UIImage(named: imageName) ?? UIImage(resource: .mandoo)
    }
}

// MARK: - UICollectionViewDataSource

extension InfinityCarousel: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: InfinityCarouselCell.identifier,
            for: indexPath
        ) as? InfinityCarouselCell else {
            return UICollectionViewCell()
        }

        cell.configure(image: imageArray[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension InfinityCarousel: UICollectionViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        moveToRealCellIfNeeded(scrollView)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        moveToRealCellIfNeeded(scrollView)
    }

    private func moveToRealCellIfNeeded(_ scrollView: UIScrollView) {
        let currentOffsetX = scrollView.contentOffset.x
        let fakeFirstOffsetX: CGFloat = 0
        let fakeLastOffsetX = CGFloat(imageArray.count - 1) * cellWidth

        if currentOffsetX == fakeFirstOffsetX {
            let offsetX = CGFloat(imageArray.count - 2) * cellWidth
            scrollView.setContentOffset(.init(x: offsetX, y: 0), animated: false)
        } else if currentOffsetX == fakeLastOffsetX {
            scrollView.setContentOffset(.init(x: cellWidth, y: 0), animated: false)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension InfinityCarousel: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

final class InfinityCarouselCell: UICollectionViewCell {

    static let identifier = "InfinityCarouselCell"

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(image: UIImage) {
        imageView.image = image
    }

    private func setStyle() {
        backgroundColor = .white

        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.backgroundColor = .white
        }
    }

    private func setUI() {
        contentView.addSubview(imageView)
    }

    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
