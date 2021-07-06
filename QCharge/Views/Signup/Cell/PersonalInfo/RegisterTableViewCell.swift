//
//  RegisterTableViewCell.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 4/7/2564 BE.
//

import UIKit

protocol RegisterTableViewCellDelegate: NSObject {
    func RegisterTableViewCellDidTapRegister(cell: RegisterTableViewCell, isRegisterState: Bool)
}

class RegisterTableViewCell: UITableViewCell {
    weak var delegate: RegisterTableViewCellDelegate?
    @IBOutlet weak var registerBtn: UIButton!
    var isRegisterState = false
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    @IBAction func tapRegister(_ sender: Any) {
        delegate?.RegisterTableViewCellDidTapRegister(cell: self, isRegisterState: isRegisterState)
    }
    
}
