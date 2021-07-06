//
//  SettingLabelTableViewCell.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 5/7/2564 BE.
//

import UIKit

class SettingLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet private weak var sectionImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setCell(image: UIImage?, title: String) {
        if let img = image {
            sectionImageView.image = img
        }
        containerView.addShadow()
        titleLabel.text = title
    }
}

protocol SettingBtnTableViewCellDelegate: NSObject {
    func settingBtnTableViewCellDidTapCell(cell: SettingBtnTableViewCell)
}

class SettingBtnTableViewCell: UITableViewCell {
    @IBOutlet private weak var showImageView: UIImageView!
    @IBOutlet weak var btnOutlet: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    weak var delegate: SettingBtnTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerView.addShadow()
    }
    
    func setCell(image: UIImage?, title: String) {
        if let img = image {
            showImageView.image = img
        }
        btnOutlet.setTitle(title, for: .normal)
    }
    
    @IBAction func didTapAction(_ sender: Any) {
        delegate?.settingBtnTableViewCellDidTapCell(cell: self)
    }
}
