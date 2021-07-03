//
//  SignupViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit
import FlexibleSteppedProgressBar
import SCLAlertView

class SignupViewController: UIViewController {
    @IBOutlet private weak var stepperView: FlexibleSteppedProgressBar!
    @IBOutlet private weak var tableView: UITableView!
    private let viewModel = SignupViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Create a new account"
        hideKeyboardWhenTappedAround()
        stepperView.delegate = self
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TermAndConditionTableViewCell", bundle: nil), forCellReuseIdentifier: "termandcon")
        tableView.register(UINib(nibName: "VerifyTableViewCell", bundle: nil), forCellReuseIdentifier: "verify")
    }
    
    private func updateStateStepper(index: Int) {
        stepperView.completedTillIndex = index
        stepperView.currentIndex = index
        tableView.reloadData()
    }
    
    private func showAlertOTP() {
        let alert = AlertOTP.createState()
        alert.showSuccess("Verify OTP", subTitle: "")
    }
}

extension SignupViewController: UITableViewDelegate {
    
}

extension SignupViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let row = viewModel.numberOfRowsInSection(section: stepperView.currentIndex)
        print(row)
        return row
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
    func VerifyTableViewCellRequestOTP(cell: VerifyTableViewCell) {
        view.endEditing(true)
        showAlertOTP()
    }
}
