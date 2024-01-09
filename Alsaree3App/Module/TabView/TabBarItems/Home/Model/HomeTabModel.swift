//
//  HomeTabModel.swift
//  Alsaree3App
//
//  Created by Neosoft on 05/01/24.
//
//
//device_type:ios
//type:7
//device_token:d_6XhvKgLkQms-fibnKiTn:APA91bGR65GAR40Pr9G-jXovSEY0pTn-TVzf7GguztertSK8aRqixJL6312erZQtR6KYagrfrb5nf_nERISzizU7P1SqscYy43DLxhjdpVgnxzxlGIWA449QpeYzcLSSXuhi61DHZYZW
//device_unique_id:D2F93AE1-0D89-49C8-8A5B-EF2564124BEE

import Foundation

//model For setting the Static data in TableView
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

// MARK: ChechFeedBackMOdel
struct CheckFeedBackModel:Codable{
    let success : Bool
}


struct ApiErrorModel:Codable{
    let success : Bool
    let error_code : Int
}


enum APIError: Error {
    case decodingError
    case apiError(success: Bool, errorCode: Int)
}
