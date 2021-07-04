//
//  UserModel.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 3/7/2564 BE.
//

import Foundation

struct UserModel: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var vehicleInfo: VehicleModel
}


