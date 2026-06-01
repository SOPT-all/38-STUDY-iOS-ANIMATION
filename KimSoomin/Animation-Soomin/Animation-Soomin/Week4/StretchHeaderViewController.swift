//
//  StretchHeaderViewController.swift
//  Animation-Soomin
//
//  Created by mandoo on 6/1/26.
//

import UIKit

import SnapKit
import Then

final class StretchHeaderViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let imageView = UIImageView()
    
    // 이미지가 늘어날 때 컨텐츠들이 아래로 밀리지 않도록 고정된 영역 역할을 해줄 공간
    private let imageContainerView = UIView()
    private let label = UILabel()
    
    // MARK: - Properties
    
    // 이미지 Top 제약조건을 동적으로 변경하기 위해 변수로 선언
    private var imageViewTopConstraint: Constraint?
    private let headerHeight: CGFloat = 450
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
        setLayout()
        setStyle()
        setDelegate()
    }
    
    private func setUI() {
        self.view.addSubviews(scrollView, imageView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(imageContainerView, label)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.width.equalTo(self.view.frame.width)
            $0.height.equalTo(2000)
        }
        
        imageContainerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(headerHeight)
        }
        
        imageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            self.imageViewTopConstraint = $0.top.equalTo(view.safeAreaLayoutGuide).constraint
            $0.bottom.equalTo(imageContainerView.snp.bottom)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(imageContainerView.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setStyle() {
        scrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
        }
        
        imageView.do {
            $0.image = .mandoo
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        label.do {
            $0.text = "아래로 댕겨바"
        }
    }
    
    private func setDelegate() {
        scrollView.delegate = self
    }
}

// MARK: - UIScrollViewDelegate

extension StretchHeaderViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        if yOffset < 0 {
            // [1] 사용자가 화면을 아래로 당겼을 때
            imageViewTopConstraint?.update(offset: yOffset)
        } else {
            // [2] 사용자가 화면을 위로 올렸을 때
            imageViewTopConstraint?.update(offset: -yOffset)
        }
    }
}
