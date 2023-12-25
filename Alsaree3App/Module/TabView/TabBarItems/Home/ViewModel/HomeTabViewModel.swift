//
//  HomeTabViewModel.swift
//  Alsaree3App
//
//  Created by Neosoft on 18/12/23.
//

import Foundation
struct resturentCollectionViewDetails{
    var name : String
    var details : [OrderAgain]
}
class HomeTabViewModel{
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
    
    
    enum SectionAboveHeader:Int,CaseIterable{
        case orderStatus = 0
        case bannerAdv
    }
    
    enum SectionBelowHeader:Int,CaseIterable{
        case dealsCollection
        case foodCategoryList
        case orderAgain
        case featured
        case offersNearby
        case otherCells
    }
    
    var HomeTabData = [
        SectionAboveHeader.allCases,
        SectionBelowHeader.allCases
    ] as [Any]
    
}
