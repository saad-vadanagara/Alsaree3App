//
//  UserDefault+Extention.swift
//  Alsaree3App
//
//  Created by Neosoft on 02/01/24.
//

import Foundation

enum UserDefaultKeys: String {
    case isLoggedIn
    case userToken
    case address
}

extension UserDefaults{
    func getUserToken() -> String? {
        return string(forKey: UserDefaultKeys.userToken.rawValue)
    }
}
