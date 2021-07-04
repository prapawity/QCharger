//
//  SignupViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit
import FlexibleSteppedProgressBar
import SkyFloatingLabelTextField
import SCLAlertView

class SignupViewController: UIViewController {
    @IBOutlet private weak var stepperView: FlexibleSteppedProgressBar!
    @IBOutlet private weak var tableView: UITableView!
    private let viewModel = SignupViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObserver()
    }
    
    private func setupUI() {
        navigationItem.title = "Create a new account"
        hideKeyboardWhenTappedAround()
        stepperView.delegate = self
        setupTableView()
        automaticallyToggleKeyboard()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TermAndConditionTableViewCell", bundle: nil), forCellReuseIdentifier: "termandcon")
        tableView.register(UINib(nibName: "VerifyTableViewCell", bundle: nil), forCellReuseIdentifier: "verify")
        tableView.register(UINib(nibName: "KeyWithTFTableViewCell", bundle: nil), forCellReuseIdentifier: "personaltf")
        tableView.register(UINib(nibName: "KeyWithBtnTableViewCell", bundle: nil), forCellReuseIdentifier: "personalbtn")
        tableView.register(UINib(nibName: "RegisterTableViewCell", bundle: nil), forCellReuseIdentifier: "registercell")
    }
    
    private func updateStateStepper(index: Int) {
        stepperView.completedTillIndex = index
        stepperView.currentIndex = index
        tableView.reloadData()
    }
    
    private func showAlertOTP() {
        let alert = AlertOTP()
        alert.delegate = self
        alert.showAlert()
    }
    
    private func setModel(type: KeyType, value: String) {
        switch type {
        case .firstName:
            viewModel.firstName = value
        case .lastName:
            viewModel.lastName = value
        case .email:
            viewModel.email = value
        case .password:
            viewModel.password = value
        case .carBrand:
            viewModel.carBrand = value
        case .carModel:
            viewModel.carModel = value
        case .license:
            viewModel.carLicense = value
        default: break
        }
    }
    
    private func redirectToLoginPage() {
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false
        )
        
        // Initialize SCLAlertView using custom Appearance
        let alert = SCLAlertView(appearance: appearance)
        alert.addButton("OK") {
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.showSuccess("Register Success", subTitle: "")
    }
}

extension SignupViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: stepperView.currentIndex)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch DataForSinupSection(rawValue: stepperView.currentIndex) {
        case .termAndCondition:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "termandcon", for: indexPath) as? TermAndConditionTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        case .verifyOTP:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "verify", for: indexPath) as? VerifyTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        case .personalInfo:
            if [0, 6].contains(indexPath.row) {
                let cell = UITableViewCell()
                cell.backgroundColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.00)
                cell.textLabel?.text = indexPath.row == 0 ? "Personal Information" : "Vehicle Information"
                return cell
            } else if indexPath.row == 7 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "personalbtn", for: indexPath) as? KeyWithBtnTableViewCell else { return UITableViewCell() }
                let dataSource = CarBrandType.allCases.map { brand in
                    return brand.stringValue()
                }
                
                cell.setCell(key: "Car brand", listData: dataSource)
                cell.delegate = self
                return cell
            } else if indexPath.row == 10 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "registercell", for: indexPath) as? RegisterTableViewCell else { return UITableViewCell() }
                cell.delegate = self
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "personaltf", for: indexPath) as? KeyWithTFTableViewCell else { return UITableViewCell() }
                
                cell.setupCell(type: KeyType(rawValue: indexPath.row) ?? .personal)
                cell.delegate = self
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
}

extension SignupViewController: FlexibleSteppedProgressBarDelegate {
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, canSelectItemAtIndex index: Int) -> Bool {
        return false
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        return position == .bottom ? DataForSinupSection(rawValue: index)?.stringValue() ?? "" : ""
    }
}

extension SignupViewController: TermAndConditionTableViewCellDelegate {
    func TermAndConditionTableViewCellDelegateAccepTermAndCondition(cell: TermAndConditionTableViewCell) {
        updateStateStepper(index: 1)
    }
}

extension SignupViewController: VerifyTableViewCellDelegate {
    func VerifyTableViewCellRequestOTP(cell: VerifyTableViewCell, mobileNumber: String) {
        view.endEditing(true)
        viewModel.mobileNumber = mobileNumber
        showAlertOTP()
    }
}

extension SignupViewController: AlertOTPDelegate {
    func alertOTPDelegateVerifyOTP(view: UIView, isSuccess: Bool) {
        if isSuccess {
            updateStateStepper(index: 2)
        }
    }
}

extension SignupViewController: KeyWithTFTableViewCellDelegate {
    func KeyWithTFTableViewCellUpdateCell(cell: KeyWithTFTableViewCell, type: KeyType, value: String) {
        setModel(type: type, value: value)
    }
    
    
}

extension SignupViewController: KeyWithBtnTableViewCellDelegate {
    func KeyWithBtnTableViewCellTapped(cell: KeyWithBtnTableViewCell, value: String) {
        setModel(type: .carBrand, value: value)
    }
}

extension SignupViewController: RegisterTableViewCellDelegate {
    func RegisterTableViewCellDidTapRegister(cell: RegisterTableViewCell) {
        guard let firstName = viewModel.firstName,
              let lastName = viewModel.lastName,
              let email = viewModel.email,
              let password = viewModel.password,
              let carModel = viewModel.carModel,
              let license = viewModel.carLicense
        else { return }
        
        let carBrandType = CarBrandType.allCases.filter { type in
            return type.stringValue() == viewModel.carBrand
        }
        let vehicleInfo = VehicleModel(carBrand: carBrandType[0],
                                       carModel: carModel,
                                       carLicense: license)
        let userData = UserModel(firstName: firstName,
                                 lastName: lastName,
                                 email: email,
                                 password: password,
                                 vehicleInfo: vehicleInfo)
        
        BaseController.shared.registerUser(user: userData)
        redirectToLoginPage()
    }
}
