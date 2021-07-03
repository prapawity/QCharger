//
//  LoginViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {
    @IBOutlet private weak var bgImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction private func tapLoginBtn(_ sender: Any) {
        
        
    }
    
    @IBAction private func tapSignupBtn(_ sender: Any) {
        guard let signupScreen = ViewControllerFactory.signupViewController() else { return }
        let navigationController = ViewControllerFactory.embedNavigationController(view: signupScreen)
        present(navigationController, animated: true, completion: nil)
    }
}
