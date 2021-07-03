//
//  SplashScreenViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delayRedirectSplashScreen()
    }
    
    private func delayRedirectSplashScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            guard let self = self, let loginScreen = ViewControllerFactory.loginViewController() else { return }
            
            self.present(loginScreen, animated: false, completion: nil)
        }
    }

}
