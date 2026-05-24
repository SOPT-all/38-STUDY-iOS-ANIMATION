import UIKit

import SnapKit

final class MandooTransformViewController: UIViewController {
    
    private let mandoo = UIImageView() // 만두
    
    private let moveButton = UIButton(type: .system) // 만두 이동
    private let sizeChangeButton = UIButton(type: .system) // 만두 크기변경
    private let rotateButton = UIButton(type: .system) // 만두 회전
    private let keyframeButton = UIButton(type: .system) // 만두 키프레임
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setMandoo()
        setButtons()
    }
    
    // 만두 자체 UI 설정
    private func setMandoo() {
        mandoo.image = UIImage(named: "mandoo")
        mandoo.contentMode = .scaleAspectFit
        
        view.addSubview(mandoo)
        
        mandoo.snp.makeConstraints {
            $0.width.height.equalTo(150)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
    }
    
    // 테스트용 버튼들 묶음 설정
    private func setButtons() {
        setButton(moveButton, title: "만두 이동")
        setButton(sizeChangeButton, title: "만두 크기변경")
        setButton(rotateButton, title: "만두 회전")
        setButton(keyframeButton, title: "만두 키프레임")
        
        moveButton.addTarget(self, action: #selector(moveMandoo), for: .touchUpInside)
        sizeChangeButton.addTarget(self, action: #selector(sizeChangeMandoo), for: .touchUpInside)
        rotateButton.addTarget(self, action: #selector(rotateMandoo), for: .touchUpInside)
        keyframeButton.addTarget(self, action: #selector(keyframeMandoo), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [
            moveButton,
            sizeChangeButton,
            rotateButton,
            keyframeButton
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(mandoo.snp.bottom).offset(150) // 만두랑 버튼 사이 간격
            $0.centerX.equalToSuperview()
        }
    }
    
    // 테스트용 버튼 개별 UI 설정
    private func setButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        
        button.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
    }
    
    // 만두 이동
    @objc private func moveMandoo() {
        UIView.animate(withDuration: 1) {
            self.mandoo.transform = CGAffineTransform(translationX: 100, y: 100)
        }
    }
    
    // 만두 크기변경
    // 한번 크기변경되면 안돌아옴
    @objc private func sizeChangeMandoo() {
        UIView.animate(withDuration: 1) {
            self.mandoo.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
    }
    
    // 만두 회전
    @objc private func rotateMandoo() {
        UIView.animate(withDuration: 1) {
            self.mandoo.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }
    
    // 만두 키프레임
    @objc private func keyframeMandoo() {
        UIView.animateKeyframes(
            withDuration: 1,
            delay: 0,
            options: [.repeat, .autoreverse]
        ) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.mandoo.transform = CGAffineTransform(translationX: 100, y: 100)
            }
        }
    }
}
