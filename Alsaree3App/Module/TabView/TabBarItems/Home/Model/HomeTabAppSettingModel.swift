//
//  HomeTabAppSettingModel.swift
//  Alsaree3App
//
//  Created by Neosoft on 08/01/24.
//

import Foundation
struct AppSettingModel: Codable {
    let success: Bool
    let message: Int
    let googleKey, adminContactEmail, adminContactPhoneNumber, welcomeWhatsappNumber: String
    let whatsappNumber: String
    let addressLimit: Int
    let termsAndConditionURL, privacyPolicyURL: String
    let isManualLocationShow, showLogoutButton, showDeleteAccountButton, isUseNewRestaurantScreens: Bool
    let isUseNewRestaurantScreensAPI, isUseNewLoginScreens, isUseNewLoginScreensAPI, isUseNewCategoryScreensAPI: Bool
    let homeScreenImageURL: String
    let isShowPartner, isShowWhatsapp, isUseReferral, isVerifyEmail: Bool
    let isVerifyPhone, isDocumentMandatory, isLoginByEmail, isLoginByPhone: Bool
    let isLoginBySocial, isProfilePictureRequired, isShowOptionalField: Bool
    let versionCode: String
    let isOpenUpdateDialog, isForceUpdate, isShowStoreDistance: Bool
    let adminCountryCode: String
    let imageBaseURL: String
    let authKey: String

    enum CodingKeys: String, CodingKey {
        case success, message
        case googleKey = "google_key"
        case adminContactEmail = "admin_contact_email"
        case adminContactPhoneNumber = "admin_contact_phone_number"
        case welcomeWhatsappNumber = "whatsapp_number"
        case whatsappNumber
        case addressLimit = "address_limit"
        case termsAndConditionURL = "terms_and_condition_url"
        case privacyPolicyURL = "privacy_policy_url"
        case isManualLocationShow = "is_manual_location_show"
        case showLogoutButton = "show_logout_button"
        case showDeleteAccountButton = "show_delete_account_button"
        case isUseNewRestaurantScreens = "is_use_new_restaurant_screens"
        case isUseNewRestaurantScreensAPI = "is_use_new_restaurant_screens_api"
        case isUseNewLoginScreens = "is_use_new_login_screens"
        case isUseNewLoginScreensAPI = "is_use_new_login_screens_api"
        case isUseNewCategoryScreensAPI = "is_use_new_category_screens_api"
        case homeScreenImageURL = "home_screen_image_url"
        case isShowPartner = "is_show_partner"
        case isShowWhatsapp = "is_show_whatsapp"
        case isUseReferral = "is_use_referral"
        case isVerifyEmail = "is_verify_email"
        case isVerifyPhone = "is_verify_phone"
        case isDocumentMandatory = "is_document_mandatory"
        case isLoginByEmail = "is_login_by_email"
        case isLoginByPhone = "is_login_by_phone"
        case isLoginBySocial = "is_login_by_social"
        case isProfilePictureRequired = "is_profile_picture_required"
        case isShowOptionalField = "is_show_optional_field"
        case versionCode = "version_code"
        case isOpenUpdateDialog = "is_open_update_dialog"
        case isForceUpdate = "is_force_update"
        case isShowStoreDistance = "is_show_store_distance"
        case adminCountryCode = "admin_country_code"
        case imageBaseURL = "image_base_url"
        case authKey = "auth_key"
    }
}
