//
//  StatusViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 6/7/2564 BE.
//

import UIKit
import CircleProgressBar
import SCLAlertView

class StatusViewController: UIViewController {

    @IBOutlet weak var progessView: CircleProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        progessView.setProgress(1.0, animated: true, duration: 10)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.alertSuccessBox()
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
            let newBalance: Double = (BaseController.shared.userSignedIn?.balance ?? 0) - 2500
            
            BaseController.shared.updateBalance(balance: newBalance)
            self.present(ViewControllerFactory.tabbarController()!, animated: false, completion: nil)
        }
        
        alert.showSuccess("Charging Complete", subTitle: "")
    }
}
