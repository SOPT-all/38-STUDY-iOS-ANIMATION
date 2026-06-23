//
//  StretchHeaderViewController.swift
//  Animation-Study
//
//  Created by Seoyoung Lee on 6/24/26.
//

import UIKit

import SnapKit
import Then

final class StretchHeaderViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let imageView = UIImageView()
    
    private let imageContainerView = UIView()
    private let label = UILabel()
    
    // MARK: - Properties
    
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
        view.addSubviews(scrollView, imageView)
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
            $0.image = .jokebear
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
            imageViewTopConstraint?.update(offset: yOffset)
        } else {
            imageViewTopConstraint?.update(offset: -yOffset)
        }
    }
}
