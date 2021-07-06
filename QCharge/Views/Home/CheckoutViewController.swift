//
//  CheckoutViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 6/7/2564 BE.
//

import UIKit

class CheckoutViewController: UIViewController {
    @IBOutlet weak var carView: UIView!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carBrandLabel: UILabel!
    @IBOutlet weak var carModel: UILabel!
    @IBOutlet weak var carPlateLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        carView.addShadow()
        bottomView.addShadow()
        carBrandLabel.text = BaseController.shared.userSignedIn?.vehicleInfo.carBrand.stringValue()
        carModel.text = BaseController.shared.userSignedIn?.vehicleInfo.carModel
        carPlateLabel.text = BaseController.shared.userSignedIn?.vehicleInfo.carLicense
    }
}
