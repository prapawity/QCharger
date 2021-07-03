//
//  SuperExtension.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import UIKit
import SCLAlertView

extension UIView {
    func addContentView(childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(childView)
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: topAnchor),
            childView.bottomAnchor.constraint(equalTo: bottomAnchor),
            childView.leadingAnchor.constraint(equalTo: leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension UIImageView {
    func blurImage() {
        guard let image = image,
              let currentFilter = CIFilter(name: "CIGaussianBlur"),
              let cropFilter = CIFilter(name: "CICrop"),
              let beginImage = CIImage(image: image)
        else { return }
        
        let context = CIContext(options: nil)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(2, forKey: kCIInputRadiusKey)
        
        cropFilter.setValue(currentFilter.outputImage, forKey: kCIInputImageKey)
        cropFilter.setValue(CIVector(cgRect: beginImage.extent), forKey: "inputRectangle")
        
        guard let output = cropFilter.outputImage else { return }
        let cgimg = context.createCGImage(output, from: output.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        self.image = processedImage
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

class AlertOTP: NSObject {
    static func createState() -> SCLAlertView {
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false
        )

        // Initialize SCLAlertView using custom Appearance
        let alert = SCLAlertView(appearance: appearance)

        // Creat the subview
        alert.customSubview = UIView(frame: CGRect(x: 0, y: 0, width: 216, height: 55))
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
        stackView.addArrangedSubview(textfield)
        
        alert.customSubview?.addContentView(childView: stackView)
        alert.addButton("Verify") {
            print("Logged in")
        }

        return alert
    }
}
