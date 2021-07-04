//
//  RegisterTableViewCell.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 4/7/2564 BE.
//

import UIKit

protocol RegisterTableViewCellDelegate: NSObject {
    func RegisterTableViewCellDidTapRegister(cell: RegisterTableViewCell)
}

class RegisterTableViewCell: UITableViewCell {
    weak var delegate: RegisterTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    @IBAction func tapRegister(_ sender: Any) {
        delegate?.RegisterTableViewCellDidTapRegister(cell: self)
    }
    
}
