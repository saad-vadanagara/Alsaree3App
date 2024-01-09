////
////  HomeTabStoreListModel.swift
////  Alsaree3App
////
////  Created by Neosoft on 08/01/24.
//
//
//import Foundation
//
//struct StoreListModel: Codable {
//    let success: Bool
//    let message: Int
//    let server_time: String
//    let store_count: Int
//    let stores: [Store]
//
//}
//
//// MARK: - Store
//struct Store: Codable {
//    let id: String
//    let isShowTop: Bool
//    let completedOrderCount: Int
//    let userRate: Double
//    let qrImageURL: String
//    let isPromocodeException: Bool
//    let extraDeliveryCharge: Int
//    let isDiscountOnDeliveryPrice: Bool
//    let deliveryPriceAfterDiscount: Int
//    let isAlsaree3Essential: Bool
//    let name, email, imageURL: String
//    let isPharmacyOrGrocery: Bool
//    let deliveryTime, deliveryTimeMax, userRateCount, deliveryRadius: Int
//    let websiteURL, slogan: String
//    let isVisible, isStoreBusy: Bool
//    let phone, countryPhoneCode: String
//    let famousProductsTags: [String]
//    let storeTime: [Storetime]
//    let location: [Double]
//    let address: Address
//    let priceRating: Int
//    let offer: String
//    let isTakingScheduleOrder: Bool
//    let distance: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case isShowTop = "is_show_top"
//        case completedOrderCount = "completed_order_count"
//        case userRate = "user_rate"
//        case qrImageURL = "qr_image_url"
//        case isPromocodeException = "is_promocode_exception"
//        case extraDeliveryCharge = "extra_delivery_charge"
//        case isDiscountOnDeliveryPrice = "is_discount_on_delivery_price"
//        case deliveryPriceAfterDiscount = "delivery_price_after_discount"
//        case isAlsaree3Essential = "is_alsaree3_essential"
//        case name, email
//        case imageURL = "image_url"
//        case isPharmacyOrGrocery = "is_pharmacy_or_grocery"
//        case deliveryTime = "delivery_time"
//        case deliveryTimeMax = "delivery_time_max"
//        case userRateCount = "user_rate_count"
//        case deliveryRadius = "delivery_radius"
//        case websiteURL = "website_url"
//        case slogan
//        case isVisible = "is_visible"
//        case isStoreBusy = "is_store_busy"
//        case phone
//        case countryPhoneCode = "country_phone_code"
//        case famousProductsTags = "famous_products_tags"
//        case storeTime = "store_time"
//        case location, address
//        case priceRating = "price_rating"
//        case offer
//        case isTakingScheduleOrder = "is_taking_schedule_order"
//        case distance
//    }
//}
//
//enum Address: String, Codable {
//    case addressIraq = "Iraq"
//    case iarq = "iarq"
//    case iraq = "iraq"
//    case the52NdStBaghdadIraq = "52nd St, Baghdad, Iraq"
//}
//
//// MARK: - StoreTime
//struct Storetime: Codable {
//    let isStoreOpen, isStoreOpenFullTime: Bool
//    let day: Int
//    let dayTime: [Daytime]
//
//    enum CodingKeys: String, CodingKey {
//        case isStoreOpen = "is_store_open"
//        case isStoreOpenFullTime = "is_store_open_full_time"
//        case day
//        case dayTime = "day_time"
//    }
//}
//
//// MARK: - DayTime
//struct Daytime: Codable {
//    let storeOpenTime: StoreOpentime
//    let storeCloseTime: StoreCloseTime
//
//    enum CodingKeys: String, CodingKey {
//        case storeOpenTime = "store_open_time"
//        case storeCloseTime = "store_close_time"
//    }
//}
//
//enum StoreCloseTime: String, Codable {
//    case the0001 = "00:01"
//    case the0030 = "00:30"
//    case the0100 = "01:00"
//    case the0130 = "01:30"
//    case the0200 = "02:00"
//    case the0230 = "02:30"
//    case the0300 = "03:00"
//    case the2059 = "20:59"
//    case the2100 = "21:00"
//    case the2230 = "22:30"
//    case the2259 = "22:59"
//    case the2300 = "23:00"
//    case the2330 = "23:30"
//    case the2359 = "23:59"
//}
//
//enum StoreOpentime: String, Codable {
//    case the0000 = "00:00"
//    case the0600 = "06:00"
//    case the0900 = "09:00"
//    case the1000 = "10:00"
//    case the1030 = "10:30"
//    case the1100 = "11:00"
//    case the1200 = "12:00"
//    case the1230 = "12:30"
//    case the1400 = "14:00"
//    case the1430 = "14:30"
//    case the1500 = "15:00"
//    case the1600 = "16:00"
//    case the1630 = "16:30"
//}
