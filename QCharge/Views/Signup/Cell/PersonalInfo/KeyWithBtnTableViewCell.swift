//
//  KeyWithBtnTableViewCell.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit

protocol KeyWithBtnTableViewCellDelegate: NSObject {
    func KeyWithBtnTableViewCellTapped(cell: KeyWithBtnTableViewCell, value: String)
}

class KeyWithBtnTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    weak var delegate: KeyWithBtnTableViewCellDelegate?
    private var dataSource: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
    }
    
    private func setupUI() {
        selectionStyle = .none
        picker.delegate = self
        picker.dataSource = self
    }
    
    func setCell(key: String, listData: [String]) {
        label.text = key
        dataSource = listData
    }
}

extension KeyWithBtnTableViewCell: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.KeyWithBtnTableViewCellTapped(cell: self, value: dataSource[row])
    }
}

extension KeyWithBtnTableViewCell: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}
