//
//  HomeTabModel.swift
//  Alsaree3App
//
//  Created by Neosoft on 05/01/24.
//
//


import Foundation


struct featureDetails{
    var featureValue : String
    var image : String?
    var istinted : Bool
}

enum ScrollDirection {
    case up
    case down
    case none
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



