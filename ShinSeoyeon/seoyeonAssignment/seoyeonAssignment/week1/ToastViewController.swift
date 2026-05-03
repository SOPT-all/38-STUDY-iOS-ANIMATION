import UIKit

import SnapKit

final class ToastViewController: UIViewController {
    
    private let toastButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .white
        setButton()
    }
    
    private func setButton() {
        toastButton.setTitle("토스트 메시지 나와라", for: .normal)
        toastButton.setTitleColor(.white, for: .normal)
        toastButton.backgroundColor = .black
        toastButton.layer.cornerRadius = 10
        toastButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        
        view.addSubview(toastButton)
        
        toastButton.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(50)
            $0.center.equalToSuperview()
        }
        
        toastButton.addTarget(self, action: #selector(showToastMessage), for: .touchUpInside)
    }
    
    @objc private func showToastMessage() {
        let toastView = UIView()
        toastView.backgroundColor = .systemOrange
        toastView.layer.cornerRadius = 10
        toastView.alpha = 0
        
        let toastLabel = UILabel()
        toastLabel.text = "토스트 메시지입니닷"
        toastLabel.textColor = .white
        toastLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        toastLabel.textAlignment = .center
        
        view.addSubview(toastView)
        toastView.addSubview(toastLabel)
        
        toastView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-80)
            $0.height.equalTo(50)
        }
        
        toastLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.bottom.equalToSuperview()
        }
        
        UIView.animate(withDuration: 0.5) {
            toastView.alpha = 1
        }
        
        UIView.animate(withDuration: 0.5, delay: 1.0) {
            toastView.alpha = 0
        } completion: { _ in
            toastView.removeFromSuperview()
        }
    }
}
