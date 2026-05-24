import UIKit
import SnapKit
import Then

class ImageChangeViewController: UIViewController {
    
    // MARK: - Data
    
    private let imageView = UIImageView()
    
    private let buttonStackView = UIStackView()
    private let turnButton = UIButton()
    private let moveButton = UIButton()
    private let bigButton = UIButton()
    private let smallButton = UIButton()
    private let resetButton = UIButton()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setStyle()
        setUI()
        setLayout()
        setAction()
    }
    
    // MARK: - Setup
    
    func setStyle() {
        imageView.do {
            $0.image = UIImage(named: "mandoo")
            $0.contentMode = .scaleAspectFit
        }
        
        buttonStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
            $0.distribution = .fillEqually
        }
        
        [turnButton, moveButton, bigButton, smallButton, resetButton].forEach {
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .systemBlue
        }
        
        turnButton.setTitle("회전시키기", for: .normal)
        moveButton.setTitle("움직이기", for: .normal)
        bigButton.setTitle("커지게하기", for: .normal)
        smallButton.setTitle("작게하기", for: .normal)
        
        resetButton.do {
            $0.setTitle("리셋", for: .normal)
            $0.backgroundColor = .systemGray
        }
    }
    
    func setUI() {
        view.addSubview(imageView)
        view.addSubview(buttonStackView)
        
        [turnButton, moveButton, bigButton, smallButton, resetButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(140)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(50)
            $0.height.equalTo(300)
        }
    }
    
    // MARK: - Action
    
    func setAction() {
        turnButton.addTarget(self, action: #selector(turnButtonDidTap), for: .touchUpInside)
        moveButton.addTarget(self, action: #selector(moveButtonDidTap), for: .touchUpInside)
        bigButton.addTarget(self, action: #selector(bigButtonDidTap), for: .touchUpInside)
        smallButton.addTarget(self, action: #selector(smallButtonDidTap), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonDidTap), for: .touchUpInside)
    }
    
    // 회전
    @objc private func turnButtonDidTap() {
        UIView.animateKeyframes(withDuration: 2, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi/2)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi * 3/2)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.imageView.transform = .identity
            }
        }
    }
    
    // 움직이기
    @objc private func moveButtonDidTap() {
        UIView.animateKeyframes(withDuration: 4.0, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.imageView.transform = self.imageView.transform.translatedBy(x: 120, y: 0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.imageView.transform = self.imageView.transform.translatedBy(x: 0, y: 120)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.imageView.transform = self.imageView.transform.translatedBy(x: -120, y: 0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.imageView.transform = self.imageView.transform.translatedBy(x: 0, y: -120)
            }
        }
    }
    
    // 커지기
    @objc private func bigButtonDidTap() {
        UIView.animate(withDuration: 1.0) {
            self.imageView.transform = self.imageView.transform.scaledBy(x: 1.3, y: 1.3)
        }
    }
    
    // 작게하기
    @objc private func smallButtonDidTap() {
        UIView.animate(withDuration: 1.0) {
            self.imageView.transform = self.imageView.transform.scaledBy(x: 0.7, y: 0.7)
        }
    }
    
    // 리셋
    @objc private func resetButtonDidTap() {
        UIView.animate(withDuration: 1.0) {
            self.imageView.transform = .identity
        }
    }
}
