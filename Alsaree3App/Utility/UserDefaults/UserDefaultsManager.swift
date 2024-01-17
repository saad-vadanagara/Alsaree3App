//
//  UserDefaultsManager.swift
//  Alsaree3App
//
//  Created by Neosoft on 16/01/24.
//

import Foundation

class UserDefaultsManager {

    static let shared = UserDefaultsManager()

    private init() {}

    // MARK: - Add Value to UserDefaults
    func setValue(_ value: Any?, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }

    // MARK: - Update Value in UserDefaults
    func updateValue(_ value: Any?, forKey key: String) {
        setValue(value, forKey: key)
    }

    // MARK: - Get Value from UserDefaults
    func getValue(forKey key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
}
