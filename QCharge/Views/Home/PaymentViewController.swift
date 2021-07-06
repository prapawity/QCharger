//
//  PaymentViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 4/7/2564 BE.
//

import UIKit
import SCLAlertView

class PaymentViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var transactionView: UIView!
    @IBOutlet weak var topupTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    var isShowTransactionView = false
    
    private func setupView() {
        topView.addShadow()
        balanceLabel.text = "\(BaseController.shared.userSignedIn?.balance ?? 0.0) Baht"
        transactionView.isHidden = !isShowTransactionView
    }

    @IBAction func openAlert(_ sender: Any) {
        if topupTF.text?.isEmpty ?? true {
            alertFailBox()
        } else {
            alertSuccessBox()
        }
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
            let newBalance: Double = (BaseController.shared.userSignedIn?.balance ?? 0) + Double(self.topupTF.text ?? "0.0")!
            
            BaseController.shared.updateBalance(balance: newBalance)
            self.balanceLabel.text = "\(BaseController.shared.userSignedIn?.balance ?? 0.0) Baht"
            self.topupTF.text = ""
        }
        
        alert.showSuccess("Topup Success", subTitle: "")
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
        
        alert.showError("Fail your balance is not enough", subTitle: "")
    }
    
    @IBAction func tapCancle(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapConfirmTransaction(_ sender: Any) {
        if BaseController.shared.userSignedIn?.balance ?? 0.0 < 2500 {
            alertFailBox()
        } else {
            guard let viewController = ViewControllerFactory.checkoutViewController() else { return }
            present(viewController, animated: true, completion: nil)
        }
    }
}
