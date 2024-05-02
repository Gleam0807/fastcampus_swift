//
//  SplashViewController.swift
//  Ccommerce
//
//  Created by SUNG on 4/29/24.
//

import Lottie
import UIKit

class SplashViewController: UIViewController {
    //    @IBOutlet weak var appiconCenterYConstraints: NSLayoutConstraint!
    //    @IBOutlet weak var appiconCenterXConstraints: NSLayoutConstraint!
    //    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var lottieAnimationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lottieAnimationView.play { _ in
            // rootView 변경 방법 / 메모리 손실 최소화
            let stortboard = UIStoryboard(name: "Home", bundle: nil)
            let viewController = stortboard.instantiateInitialViewController()
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let window = windowScene.windows.first(where: { $0.isKeyWindow }) {
                    window.rootViewController = viewController
            }
        }
        //        appiconCenterXConstraints.constant =
        //            -(view.frame.width / 2) - (appIcon.frame.width / 2)
        //        appiconCenterYConstraints.constant =
        //            -(view.frame.height / 2) - (appIcon.frame.height / 2)
        //
        //        UIView.animate(withDuration: 2) { [weak self] in
        //            self?.view.layoutIfNeeded()
        //        } autolayout을 이용한 날라가는 스플래시 애니메이션 구현
        
        //        UIView.animate(withDuration: 3, animations: { [weak self] in
        //            let rotationAngle: CGFloat = CGFloat.pi
        //            self?.appIcon.transform = CGAffineTransform(rotationAngle: rotationAngle)
        //        })
    }
}
