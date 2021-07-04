//
//  AlertOTP.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit
import SCLAlertView

protocol AlertOTPDelegate: NSObject {
    func alertOTPDelegateVerifyOTP(view: UIView, isSuccess: Bool)
}

class AlertOTP: UIView {
    private var alert: SCLAlertView?
    
    weak var delegate: AlertOTPDelegate?
    
    convenience init () {
        self.init(frame: .zero)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showAlert() {
        alert?.showSuccess("Verify OTP", subTitle: "")
    }
    
    private func commonInit() {
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false
        )
        
        // Initialize SCLAlertView using custom Appearance
        alert = SCLAlertView(appearance: appearance)
        
        // Creat the subview
        alert?.customSubview = UIView(frame: CGRect(x: 0, y: 0, width: 216, height: 55))
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        label.textColor = .darkGray
        label.text = "Your Mockup OTP is 1111"
        label.textAlignment = .center
        stackView.addArrangedSubview(label)
        
        let textfield = UITextField()
        textfield.layer.borderWidth = 0.5
        textfield.layer.cornerRadius = 5
        textfield.placeholder = "Input your OTP"
        textfield.textAlignment = .center
        textfield.keyboardType = .numberPad
        textfield.delegate = self
        stackView.addArrangedSubview(textfield)
        
        alert?.customSubview?.addContentView(childView: stackView)
        alert?.addButton("Verify") {
            self.delegate?.alertOTPDelegateVerifyOTP(view: self, isSuccess: textfield.text == "1111")
        }
    }
}

extension AlertOTP: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 4
    }
}
