import UIKit

import Lottie
import SnapKit

final class LottiePractice: UIViewController {

    // MARK: - UI

    private let lottieView = LottieAnimationView(name: "join")

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        playLottie()
    }

    // MARK: - Setup

    private func setStyle() {
        view.backgroundColor = .white

        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .loop
        lottieView.animationSpeed = 1.0
        lottieView.backgroundBehavior = .pauseAndRestore
    }

    private func setUI() {
        view.addSubview(lottieView)
    }

    private func setLayout() {
        lottieView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func playLottie() {
        lottieView.play()
    }
}
