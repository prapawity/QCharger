//
//  SignupViewModel.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import Foundation

enum DataForSinupSection: Int, CaseIterable {
    case termAndCondition
    case verifyOTP
    case personalInfo
    case success
    
    func stringValue() -> String {
        switch DataForSinupSection(rawValue: self.rawValue) {
        case .termAndCondition:
            return "Term&Policy"
        case .verifyOTP:
            return "Verify"
        case .personalInfo:
            return "Register"
        case .success:
            return "Success"
        default: return ""
            
        }
    }
}

final class SignupViewModel {
    let numberOfSections = 4
    var mobileNumber: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var carBrand: String = CarBrandType.toyota.stringValue()
    var carLicense: String?
    var carModel: String?
    
    func numberOfRowsInSection(section: Int) -> Int {
        switch DataForSinupSection(rawValue: section) {
        case .termAndCondition:
            return 1
        case .verifyOTP:
            return 1
        case .personalInfo:
            return 11
        case .success:
            return 11
        default: return 0
        }
    }
}
