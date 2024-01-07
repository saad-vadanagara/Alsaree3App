//
//  HomeTabViewModel.swift
//  Alsaree3App
//
//  Created by Neosoft on 18/12/23.
//



import Foundation
import UIKit
//main enum

enum ScrollDirection {
    case up
    case down
    case none
}


struct resturentCollectionViewDetails{
    var name : String
    var details : [OrderAgain]
}

enum SectionAboveHeader:Int,CaseIterable{
    case orderStatus = 0
    case bannerAdv
}


enum SectionBelowScrollingHeader:Int,CaseIterable{
    case dealsCollection
    case foodCategoryList
    case orderAgain
    case featured
    case offersNearby
    case otherCells
}

enum sectionOrderAgain:Int,CaseIterable{
    case orderAgain
}
enum sectionFeatured:Int,CaseIterable{
    case featured
}
enum sectionOffersNearby:Int,CaseIterable{
    case offersNearby
}

enum sectionFooter:Int,CaseIterable{
    case otherCells
}

protocol NavigateFormHomeTab{
    func seeMoreBtnNavigation()
}

class HomeTabViewModel{
    
    var activeOrder = false
    var bannerdaat = true
    var scrollingCollectionview = true
    var appSettingData : AppSettingModel?
    var checkFeedBackData : CheckFeedBackModel?
    
    var resturentCollectionViewData = [
        resturentCollectionViewDetails(name: "Order Again", details: orderAgainData),
        resturentCollectionViewDetails(name: "Featured", details: featuredData),
        resturentCollectionViewDetails(name: "Offers Nearby", details: offerNearby)
    ]
    
    var isApiCallDone = false
    
    
//    var totalData = [
//        HomeCellsList.allCases,
//        SectionData.allCases
//    ] as [Any]
    
    
   
    var HomeTabData = [
        SectionAboveHeader.allCases,
        SectionBelowScrollingHeader.allCases
    ] as [Any]
    
    
    func callApi(){
        let parameters = AppSettingParams(device_type: "ios", type: "7", device_token:"", device_unique_id:UIDevice.current.identifierForVendor?.uuidString ?? "" )
        HomeScreenServices().getAppSettings(parameters: parameters) { responce  in
            switch responce{
            case.success(let data):
                self.appSettingData = data
                authKey = data.authKey
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func callSecondApi(){
        let parameter = CheckFeedBackParams(user_id: "", server_token: "")
        HomeScreenServices().getFeedBackResponce(parameters: parameter) { responce in
            switch responce{
            case .success(let data):
                self.checkFeedBackData = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func callThirdApi(){
        let parameter = CheckFeedBackParams(user_id: "", server_token: "")
    }
    
    
    static func aesEncrypt(value: String, key: String, iv: String) throws -> String {
        let data = value.data(using: .utf8)!
        var encryptedData:Data? = Data(base64Encoded: "")
        do{
            let encrypted = try AES(key: key, iv: iv, padding: .pkcs5).encrypt([UInt8](data))
            encryptedData = Data(encrypted)
        }
        catch let error{
            print(error.localizedDescription)

        }

        return encryptedData!.base64EncodedString()
    }
    
    
}
