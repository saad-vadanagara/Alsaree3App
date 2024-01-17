//
//  Application_keyConstant.swift
//  Alsaree3App
//
//  Created by Neosoft on 16/01/24.
//

import Foundation
import UIKit

enum KeyConstant:String{
    case authKey = "BVcWXejZ32WLY8GWDhhnhKN752F8mZww"
    case key = "lRXFMcdSasKyzvAB"
    case iv16 = "SKEWJS2EGV8LP99D"
    case key2 = "XHfZhnLrWOJyPZAW"
    case iv162 = "WMVYXBCU2ZUFVJ72"
}

enum DeviceInfo: String{
    case deviceType = "ios"
    case type = "7"
    case englishLang = "en"
    case arabicLang = "ar"
}
var kDeviceUniqueId = UIDevice.current.identifierForVendor?.uuidString ?? ""
var kDeviceToken = String()
var kUserId = String()
var kServerToken = String()
var kCity1 = String()
var kCity2 = String()
var kCity3 = String()
var kCityCode = String()
var kCountryCode = String()
var kCountryCode2 = String()
var kCartUniqueToken = String()
var kAddress = String()
var kCountry = String()
var kStoreDeliveryId = String()
var kCityId = String()


