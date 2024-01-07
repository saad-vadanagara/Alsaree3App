
import Foundation

typealias AnyDict = [String: Any]
typealias AnyDictString = [String: String]

var authKey : String = String()

let DEV_ROOT_POINT = "https://alsaree3service.com"
let PROD_ROOT_POINT = ""

let contentValue = "application/x-www-form-urlencoded"
let contentKey = "Content-Type"

enum NetworkEnvironment: String {
    case development
    case production
}

var networkEnvironment: NetworkEnvironment {
    return .development
}

var BaseURL: String {
    switch networkEnvironment {
    case .development :
        return DEV_ROOT_POINT
    case .production :
        return PROD_ROOT_POINT
    }
}


enum APIServices {
    
    case AppSettings(parameters: AnyDict)
    case CheckFeedBack(parameters: AnyDict)
    case GetLoyalityDetails(parameters: AnyDict)
    case GetTheCartWithCampaignDiscount(parameters: AnyDict)
}

extension APIServices {
    var Path: String {
        let apiDomain = "/api/Z381SQ4J6H/"
        var servicePath: String = ""
        switch self {
        case .AppSettings: servicePath = apiDomain + "admin/check_app_keys"
        case .CheckFeedBack: servicePath = apiDomain + "user/check_feedback"
        case .GetLoyalityDetails: servicePath = apiDomain + "get_loyalty_detail"
        case .GetTheCartWithCampaignDiscount : servicePath = apiDomain + "get_loyalty_detail"
            
        }
        
        return BaseURL + servicePath
    }
    
    
    var parameters: AnyDict? {
        switch self {
        case .AppSettings(let param):
            return param
        case .CheckFeedBack(let param):
            return param
        default:
            return nil
        }
    }
    
    //headers code
    var header: AnyDictString {
        var headerDict = AnyDictString()
        headerDict[contentKey] = contentValue
        
        switch self {
        case .AppSettings,.CheckFeedBack:
            return appSettingsHeader()
        default:
            break
        }
        return headerDict
    }
    
    var httpMethod: String {
        switch self {
        case .AppSettings,.CheckFeedBack:
            return "POST"
        default:
            return "GET"
        }
    }
    
    private func appSettingsHeader() -> AnyDictString {
        var headerDict = AnyDictString()
        headerDict[contentKey] = contentValue
        let longitude = String(describing: LocationManager.shared.currentLocation?.longitude)
        let latitude = String(describing: LocationManager.shared.currentLocation?.latitude)
        let app_version = "1.3.00"
        var auth_key = String()
        do {
            switch self{
            case .AppSettings:
                auth_key = try EncriptionManager().aesEncrypt(value: KeyConstant.authKey, key: KeyConstant.key, iv: KeyConstant.iv16)
            case.CheckFeedBack:
                auth_key = try EncriptionManager().aesEncrypt(value: authKey, key: KeyConstant.key, iv: KeyConstant.iv16)
            }
        } catch {
            print(error)
        }
        let device_type = "ios"
        let language = "en"
        headerDict = [
            contentKey: contentValue,
            "longitude": longitude,
            "latitude": latitude,
            "app_version": app_version,
            "auth_key": auth_key,
            "device_type": device_type,
            "language": language
        ]
        return headerDict
    }
    
}


