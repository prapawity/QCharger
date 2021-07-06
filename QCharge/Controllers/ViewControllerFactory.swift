//
//  ViewControllerFactory.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit

private enum StoryboardName: String {
    case login = "Login"
    case splashScreen = "SplashScreen"
    case signup = "Signup"
    case homeTabbar = "HomeBase"
    case notification = "Notification"
}

final class ViewControllerFactory {
    
    static func embedNavigationController(view: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }
    
    static func splashScreenViewController() -> SplashScreenViewController? {
        guard let splashScreenViewController = UIStoryboard(name: StoryboardName.splashScreen.rawValue, bundle: nil).instantiateInitialViewController() as? SplashScreenViewController else { return nil }
        
        splashScreenViewController.modalPresentationStyle = .fullScreen
        return splashScreenViewController
    }
    
    static func loginViewController() -> LoginViewController? {
        guard let loginViewController = UIStoryboard(name: StoryboardName.login.rawValue, bundle: nil).instantiateInitialViewController() as? LoginViewController else { return nil }
        
        loginViewController.modalPresentationStyle = .fullScreen
        return loginViewController
    }
    
    static func signupViewController() -> SignupViewController? {
        guard let signupViewController = UIStoryboard(name: StoryboardName.signup.rawValue, bundle: nil).instantiateInitialViewController() as? SignupViewController else { return nil }
        
        signupViewController.modalPresentationStyle = .fullScreen
        return signupViewController
    }
    
    static func tabbarController() -> UITabBarController? {
        guard let homeTabbar = UIStoryboard(name: StoryboardName.homeTabbar.rawValue, bundle: nil).instantiateInitialViewController() as? UITabBarController else { return nil }
        
        homeTabbar.modalPresentationStyle = .fullScreen
        return homeTabbar
    }
    
    static func homeViewController() -> HomeViewController? {
        guard let homeViewController = UIStoryboard(name: StoryboardName.homeTabbar.rawValue, bundle: nil).instantiateViewController(identifier: "home") as? HomeViewController else { return nil }
        
        homeViewController.modalPresentationStyle = .fullScreen
        return homeViewController
    }
    
    static func mapViewController() -> MapViewController? {
        guard let mapViewController = UIStoryboard(name: StoryboardName.homeTabbar.rawValue, bundle: nil).instantiateViewController(identifier: "map") as? MapViewController else { return nil }
        
        mapViewController.modalPresentationStyle = .fullScreen
        return mapViewController
    }
    
    static func settingViewController() -> SettingViewController? {
        guard let mapViewController = UIStoryboard(name: StoryboardName.homeTabbar.rawValue, bundle: nil).instantiateViewController(identifier: "setting") as? SettingViewController else { return nil }
        
        mapViewController.modalPresentationStyle = .fullScreen
        return mapViewController
    }
    
    static func NotificationViewController() -> ListNotificationViewController? {
        guard let notifiaction = UIStoryboard(name: StoryboardName.notification.rawValue, bundle: nil).instantiateInitialViewController() as? ListNotificationViewController else { return nil }
        
        notifiaction.modalPresentationStyle = .fullScreen
        return notifiaction
    }
    
    static func PaymentViewController() -> PaymentViewController? {
        guard let notifiaction = UIStoryboard(name: StoryboardName.homeTabbar.rawValue, bundle: nil).instantiateViewController(identifier: "payment") as? PaymentViewController else { return nil }
        
        notifiaction.modalPresentationStyle = .fullScreen
        return notifiaction
    }
    
    static func checkoutViewController() -> CheckoutViewController? {
        guard let notifiaction = UIStoryboard(name: StoryboardName.homeTabbar.rawValue, bundle: nil).instantiateViewController(identifier: "checkout") as? CheckoutViewController else { return nil }
        
        notifiaction.modalPresentationStyle = .fullScreen
        return notifiaction
    }
}
