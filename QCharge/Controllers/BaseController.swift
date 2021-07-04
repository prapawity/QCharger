//
//  BaseController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 4/7/2564 BE.
//

import Foundation

private enum BaseKey: String {
    case allUser = "AllUser"
}

final class BaseController {
    static let shared = BaseController()
    private let userDefaults = UserDefaults.standard
    func registerUser(user: UserModel) {
        var allUSer = getAllUser()
        allUSer.append(user)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(allUSer){
            UserDefaults.standard.set(encoded, forKey: BaseKey.allUser.rawValue)
        }
        
        print("CHECK REGISTER", getAllUser())
    }
    
    private func getAllUser() -> [UserModel] {
        guard let objects = UserDefaults.standard.value(forKey: BaseKey.allUser.rawValue) as? Data else { return [] }
        
        let decoder = JSONDecoder()
        if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [UserModel] {
            return objectsDecoded
        } else {
            return []
        }
    }
    
    func login(email: String, password: String) -> Bool {
        return true
    }
}
