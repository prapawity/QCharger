//
//  TermAndConditionTableViewCell.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit
import SimpleCheckbox

protocol TermAndConditionTableViewCellDelegate: NSObject {
    func TermAndConditionTableViewCellDelegateAccepTermAndCondition(cell: TermAndConditionTableViewCell)
}

class TermAndConditionTableViewCell: UITableViewCell {

    @IBOutlet private weak var checkBox: Checkbox!
    @IBOutlet weak var continueBtn: UIButton!
    
    weak var delegate: TermAndConditionTableViewCellDelegate?
    
    private var isAccepTermAndCondition = false {
        didSet {
            continueBtn.isEnabled = isAccepTermAndCondition
            continueBtn.backgroundColor = isAccepTermAndCondition ? UIColor(red: 1.00, green: 0.62, blue: 0.11, alpha: 1.00) : .lightGray
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
        setupCheckBox()
    }
    
    private func setupCheckBox() {
        checkBox.checkmarkStyle = .circle
        checkBox.borderStyle = .circle
        
        checkBox.valueChanged = { [weak self] value in
            guard let self = self else { return }
            self.isAccepTermAndCondition = value
        }
    }
    
    @IBAction func tapContinue(_ sender: Any) {
        delegate?.TermAndConditionTableViewCellDelegateAccepTermAndCondition(cell: self)
    }
}
