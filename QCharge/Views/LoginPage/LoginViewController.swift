//
//  LoginViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit
import SkyFloatingLabelTextField
import SCLAlertView

class LoginViewController: UIViewController {
    @IBOutlet private weak var bgImageView: UIImageView!
    @IBOutlet weak var emailTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var passwordTF: SkyFloatingLabelTextFieldWithIcon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        hideKeyboardWhenTappedAround()
        
    }
    
    private func alertFailBox() {
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false
        )
        
        // Initialize SCLAlertView using custom Appearance
        let alert = SCLAlertView(appearance: appearance)
        alert.addButton("OK"){}
        
        alert.showError("Login Fail", subTitle: "")
    }
    
    private func alertSuccessBox() {
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false
        )
        
        let alert = SCLAlertView(appearance: appearance)
        alert.addButton("OK") {
            self.redirectToHomePage()
        }
        
        alert.showSuccess("Login Success", subTitle: "")
    }
    
    private func redirectToHomePage() {
        guard let homePage = ViewControllerFactory.tabbarController() else{ return }
        present(homePage, animated: false, completion: nil)
    }
    
    private func alertDialog(isSuccess: Bool) {
        if isSuccess {
            alertSuccessBox()
        } else {
            alertFailBox()
        }
    }
    
    @IBAction private func tapLoginBtn(_ sender: Any) {
        guard let email = emailTF.text, let password = passwordTF.text else { return alertDialog(isSuccess: false) }
        alertDialog(isSuccess: BaseController.shared.login(email: email, password: password))
        
    }
    
    @IBAction private func tapSignupBtn(_ sender: Any) {
        guard let signupScreen = ViewControllerFactory.signupViewController() else { return }
        let navigationController = ViewControllerFactory.embedNavigationController(view: signupScreen)
        present(navigationController, animated: true, completion: nil)
    }
}
