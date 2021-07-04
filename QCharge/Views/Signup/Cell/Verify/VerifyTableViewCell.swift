//
//  VerifyTableViewCell.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit

protocol VerifyTableViewCellDelegate: NSObject {
    func VerifyTableViewCellRequestOTP(cell: VerifyTableViewCell, mobileNumber: String)
}

class VerifyTableViewCell: UITableViewCell {
    @IBOutlet weak var mobileNumberTextfield: UITextField!
    @IBOutlet weak var requestOTPBtn: UIButton!
    
    weak var delegate: VerifyTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
        mobileNumberTextfield.delegate = self
        mobileNumberTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        requestOTPBtn.isEnabled = textField.text?.count == 10
        requestOTPBtn.backgroundColor = textField.text?.count == 10 ? .systemBlue : .lightGray

    }
    
    @IBAction func tapRequestOTP(_ sender: Any) {
        guard let txt = mobileNumberTextfield.text else { return }
        
        delegate?.VerifyTableViewCellRequestOTP(cell: self, mobileNumber: txt)
    }
}

extension VerifyTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 10
    }
}
