import UIKit
import SnapKit

final class BurrViewController: UIViewController {
    
    private let mandoo = UIImageView() // 만두
    private let burrButton = UIButton(type: .system) // 부르르버튼
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setMandoo()
        setButton()
    }
    
    // 만두의 위치..
    private func setMandoo() {
        mandoo.image = UIImage(named: "mandoo")
        mandoo.contentMode = .scaleAspectFit
        
        view.addSubview(mandoo)
        
        mandoo.snp.makeConstraints {
            $0.width.height.equalTo(150)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(80)
        }
    }
    
    // 부르르 버튼 자체 설정
    private func setButton() {
        burrButton.setTitle("부르르", for: .normal)
        burrButton.setTitleColor(.white, for: .normal)
        burrButton.backgroundColor = .black
        burrButton.layer.cornerRadius = 10
        burrButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        
        view.addSubview(burrButton)
        
        burrButton.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(50)
            $0.top.equalTo(mandoo.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        burrButton.addTarget(self, action: #selector(burrDidTap), for: .touchUpInside)
    }
    
    // 부르르버튼 탭했을때 애니메이션!!
    @objc private func burrDidTap() {
        UIView.animate(
            withDuration: 0.01, // 이게 짧을수록 빠르게 부르르함
            delay: 0,
            options: [.repeat, .autoreverse]
        ) {
            self.mandoo.transform = CGAffineTransform(translationX: 50, y: 0) // 엑스축으로만 움직이게
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.mandoo.layer.removeAllAnimations()
            self.mandoo.transform = .identity
        }
    }
}
