//
//  VehicleModel.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import Foundation

enum CarBrandType: Int, CaseIterable, Codable {
    case toyota
    case honda
    
    func stringValue() -> String {
        switch self {
        case .toyota:
            return "Toyota"
        case .honda:
            return "Honda"
        }
    }
}

struct VehicleModel: Codable {
    var carBrand: CarBrandType
    var carModel: String
    var carLicense: String
}
