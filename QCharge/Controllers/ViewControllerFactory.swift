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
}
