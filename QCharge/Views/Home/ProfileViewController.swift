//
//  ProfileViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 4/7/2564 BE.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet private weak var avatarImageView: UIButton!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var carLabel: UILabel!
    @IBOutlet private weak var licenseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        avatarImageView.layer.borderWidth = 5
        avatarImageView.layer.borderColor = #colorLiteral(red: 1, green: 0.6006348729, blue: 0, alpha: 1)
        topView.addShadow()
        
        nameLabel.text = "\(BaseController.shared.userSignedIn?.firstName ?? "") \(BaseController.shared.userSignedIn?.lastName ?? "")"
        emailLabel.text = "\(BaseController.shared.userSignedIn?.email ?? "")"
        phoneLabel.text = "\(BaseController.shared.userSignedIn?.mobileNumber ?? "")"
        carLabel.text = "\(BaseController.shared.userSignedIn?.vehicleInfo.carBrand.stringValue() ?? "")"
        licenseLabel.text = "\(BaseController.shared.userSignedIn?.vehicleInfo.carLicense ?? "")"
    }
    
    @IBAction func tapSettingPage(_ sender: Any) {
        guard let settingScreen = ViewControllerFactory.settingViewController() else { return }
        navigationController?.pushViewController(settingScreen, animated: true)
    }
}
