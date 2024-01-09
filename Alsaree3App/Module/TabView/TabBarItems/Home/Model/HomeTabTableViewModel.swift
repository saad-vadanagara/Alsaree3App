//
//  HomeTabModel.swift
//  Alsaree3App
//
//  Created by Neosoft on 05/01/24.
//
//


import Foundation

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



