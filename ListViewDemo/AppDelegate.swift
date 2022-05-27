//
//  AppDelegate.swift
//  ListViewDemo
//
//  Created by Tung Vu on 27/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

import SnapKit
extension UIView {
    func snp_makeConstraints(withIn container: UIView, _ closure: (ConstraintMaker) -> Void) {
        container.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        self.snp.makeConstraints(closure)
    }
}

extension UIView {
    private var shimmerAnimationKey: String {
        return "shimmer"
    }
    
    func startShimmering(size: CGSize = .zero) {
        let blueGrey = UIColor.lightGray.cgColor
        let alpha = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        let width = size == .zero ? bounds.width : size.width
        let height = size == .zero ? bounds.height : size.height
        
        let gradient = CAGradientLayer()
        gradient.colors = [alpha, blueGrey, alpha]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.locations = [0.4, 0.5, 0.6]
        gradient.frame = CGRect(x: -width, y: 0, width: width*3, height: height)
        layer.mask = gradient
        
        let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.locations))
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = 1.25
        animation.repeatCount = .infinity
        gradient.add(animation, forKey: shimmerAnimationKey)
    }
    
    private func stopShimmering() {
        layer.mask = nil
    }
}
