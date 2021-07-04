//
//  KeyWithTFTableViewCell.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit

enum KeyType: Int, CaseIterable {
    case personal
    case firstName
    case lastName
    case email
    case password
    case confirmPassword
    case vehicleInfo
    case carBrand
    case carModel
    case license
    
    func stringValue() -> String {
        switch self {
        case .firstName:
            return"First name"
        case .lastName:
            return "Last name"
        case .email:
            return "E-mail"
        case .password:
            return "Password"
        case .confirmPassword:
            return "Confirm-Password"
        case .carModel:
            return "Car Model"
        case .license:
            return "Car license plate"
        default: return ""
        }
    }
}

protocol KeyWithTFTableViewCellDelegate: NSObject {
    func KeyWithTFTableViewCellUpdateCell(cell: KeyWithTFTableViewCell, type: KeyType, value: String)
}

class KeyWithTFTableViewCell: UITableViewCell {

    @IBOutlet weak var valueTF: UITextField!
    @IBOutlet weak var keyLabel: UILabel!
    private var cellType: KeyType?
    weak var delegate: KeyWithTFTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        valueTF.delegate = self
        selectionStyle = .none
    }
    
    func setupCell(type: KeyType) {
        cellType = type
        keyLabel.text = type.stringValue()
        valueTF.placeholder = "please input your \(type.stringValue())"
        
        if [KeyType.password, .confirmPassword].contains(type) {
            valueTF.textContentType = .newPassword
            valueTF.isSecureTextEntry = true
        }
        
    }
}

extension KeyWithTFTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.KeyWithTFTableViewCellUpdateCell(cell: self, type: cellType ?? .personal, value: textField.text ?? "")
    }
}
