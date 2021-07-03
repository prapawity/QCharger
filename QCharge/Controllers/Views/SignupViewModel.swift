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
    
    func numberOfRowsInSection(section: Int) -> Int {
        switch DataForSinupSection(rawValue: section) {
        case .termAndCondition:
            return 1
        case .verifyOTP:
            return 1
        case .personalInfo:
            return 11
        case .success:
            return 1
        default: return 0
        }
    }
}
