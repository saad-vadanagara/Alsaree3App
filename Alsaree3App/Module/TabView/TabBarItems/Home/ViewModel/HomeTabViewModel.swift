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
    
    
   
    var HomeTabData = [
        SectionAboveHeader.allCases,
        SectionBelowScrollingHeader.allCases
    ] as [Any]
    
}
