//
//  HomeTabViewModel.swift
//  Alsaree3App
//
//  Created by Neosoft on 18/12/23.
//



import Foundation
import UIKit
//main enum
protocol NavigateFormHomeTab{
    func seeMoreBtnNavigation()
}

class HomeTabViewModel{
    
    var activeOrder = false
    var bannerdaat = true
    var scrollingCollectionview = true
    var appSettingData : AppSettingModel?
    var checkFeedBackData : CheckFeedBackModel?
    var loyaltyDetail : LoyaltyDetailsModel?
    var deliveryListForNearestCityData : DeliveryListForNearestCityModel?
    var homeScreenMainDetailWithBannerImagesOffersData: HomeScreenMainDetailWithBannerImagesOffersModel?
    var homeScreenStoreListData : StoreListModel?
    var pushZoneData : PushZoneModel?
    var homeTabDeligate : HomeTabViewController?
    
    var resturentCollectionViewData = [
        resturentCollectionViewDetails(name: "Order Again", details: orderAgainData),
        resturentCollectionViewDetails(name: "Featured", details: featuredData),
        resturentCollectionViewDetails(name: "Offers Nearby", details: offerNearby)
    ]
    
    var isApiCallDone = false
    let dispatchGroup = DispatchGroup()
    
    var HomeTabData = [
        SectionAboveHeader.allCases,
        SectionBelowScrollingHeader.allCases
    ] as [Any]
    
    
    
        func callHomeScreenApis(){
            dispatchGroup.enter()
            callApi()
            dispatchGroup.wait()
            dispatchGroup.enter()
            callFeedBackApi()
            dispatchGroup.enter()
            callLoyaltyDetailApi()
            dispatchGroup.enter()
            callDeliveryListForNearestCityApi()
            dispatchGroup.enter()
            callHomeScreenMainDetailWithBannerImagesOffersApi()
            dispatchGroup.enter()
            callHomeScreenStoreListApi()
            dispatchGroup.enter()
            callPushZoneApi()
            dispatchGroup.notify(queue: .main) {
                self.homeTabDeligate?.hometabTableView.reloadData()
            }
        }
    
//    func callHomeScreenApis(){
//        callApi()
//        callFeedBackApi()
//        callLoyaltyDetailApi()
//        callDeliveryListForNearestCityApi()
//        callHomeScreenMainDetailWithBannerImagesOffersApi()
//        callHomeScreenStoreListApi()
//        callPushZoneApi()
//    }
    
    func callApi(){
        let parameters = AppSettingParams(device_type: "ios", type: "7", device_token:"", device_unique_id:UIDevice.current.identifierForVendor?.uuidString ?? "" )
        HomeScreenServices().getAppSettings(parameters: parameters) { responce  in
            switch responce{
            case.success(let data):
                authKey = data.authKey
                self.dispatchGroup.leave()
                print("AppSetting done")
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func callFeedBackApi(){
        let parameter = CheckFeedBackParams(user_id: "", server_token: "")
        HomeScreenServices().getFeedBackResponce(parameters: parameter) { responce in
            switch responce{
            case .success(let data):
                print(data)
                self.dispatchGroup.leave()
                self.checkFeedBackData = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func callLoyaltyDetailApi(){
        let parameter = LoyaltyDetailParams(user_id: "")
        HomeScreenServices().getLoyaltyDetail(parameters: parameter) { responce in
            switch responce{
            case .success(let data):
                print(data)
                self.dispatchGroup.leave()
                self.loyaltyDetail = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func callDeliveryListForNearestCityApi(){
        let parameter = DeliveryListForNearestCityParams(city3: "", user_id: "", country: "", address: "", cart_unique_token: "", city2: "", city1: "", country_code_2: "", city_code: "", country_code: "", latitude: "33.341658", server_token: "", longitude: "44.41627")
        HomeScreenServices().getDeliveryListForNearestCity(parameters: parameter) { responce in
            switch responce{
            case .success(let data):
                print(data)
                self.dispatchGroup.leave()
                self.deliveryListForNearestCityData = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //error Calling the data
    func callHomeScreenMainDetailWithBannerImagesOffersApi(){
        let parameter = HomeScreenMainDetailWithBannerImagesOffersParams(latitude: "33.341658", longitude: "44.41627", language: "en", page: "1", store_delivery_id: "5ab0d991bfe73957dc8ea53d", city_id: "5abcd381d761ca635c980349", user_id: "", server_token: "", cart_unique_token: "")
        HomeScreenServices().getHomeScreenMainDetailWithBannerImagesOffers(parameters: parameter) { responce in
            switch responce{
            case .success(let data):
                self.homeScreenMainDetailWithBannerImagesOffersData = data
                self.dispatchGroup.leave()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func callHomeScreenStoreListApi(){
        let parameter = HomeScreenStoreListParams(city_id: "5abcd381d761ca635c980349", page: "1", longitude: "44.41627", cart_unique_token: "", store_delivery_id: "5ab0d991bfe73957dc8ea53d", user_id: "", latitude: "33.341658", language: "en", server_token: "")
        HomeScreenServices().getHomeScreenStoreList(parameters: parameter) { responce in
            switch responce{
            case .success(let data):
                print(data)
                self.homeScreenStoreListData = data
                self.dispatchGroup.leave()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func callPushZoneApi(){
        let parameter = PushZoneParams(longitude: "44.41627", latitude: "33.341658")
        HomeScreenServices().getPushZoneData(parameters: parameter) { responce in
            switch responce{
            case .success(let data):
                print(data)
                self.pushZoneData = data
                self.dispatchGroup.leave()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
