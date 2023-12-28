//
//  Constant.swift
//  Alsaree3App
//
//  Created by Neosoft on 15/12/23.
//

import Foundation
import UIKit

struct ColorConstant{
    
    static var primaryWhiteBgcolor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
    static var primaryYellowColor = UIColor(red: 0.87, green: 0.5, blue: 0.21, alpha: 1)
    static var whitecolor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    static var blackcolor = UIColor.black
    static var borderColorYellow = UIColor(red: 0.87, green: 0.5, blue: 0.21, alpha: 1)
    static var borderColorGray = UIColor(red: 0.84, green: 0.83, blue: 0.83, alpha: 1)

    
}

enum FontConstant:String{
    case regular = "Cairo-Regular"
    case bold = "Cairo-Bold"
    case thin = "Cairo-Medium"
    case light = "Cairo-Light"
}

enum TextConstant:String{
    case empty = ""
    case strokeEnd = "strokeEnd"
    case animationProgress = "animationProgress"
    case alsaree3App = "Alsaree3 App"
    case activeOrder = "Active Order"
    case orderNumber5thAvenueAlFurjanArea = "Order Number - 5th Avenue - Al Furjan Area"
    
}

enum ButtonTextConstant:String{
    case alFurjanArea = "Al Furjan Area"
    
    
}

enum ImageConstant:String{
    case downArrow = "downArrow"
    case scooter = "scooter"
    case orderUpdate = "orderUpdate"
    case arrowRight = "arrowRight"
    case bannerAdvertisement = "bannerAdvertisement"
}

enum CellConstant : String{
    case activeOrderHomeTabCell = "ActiveOrderHomeTabCell"
    case bannerHomeTabCell = "BannerHomeTabCell"
    case categoryHomeTabCell = "CategoryHomeTabCell"
    case advertisementCell = "AdvertisementCell"
    case foodCatrgoryCell = "FoodCatrgoryCell"
}

enum TabBar : String{
    case Home
    case Search
    case Profile
    case Basket
    
    var imageName:String{
        switch self{
        case .Home:
            return "Home"
        case .Search:
            return "Search"
        case .Profile:
            return "user"
        case .Basket:
            return "bag"
        }
    }
}


enum HomeCellsList : Int, CaseIterable{
    case orderStatus = 0
    case bannerAdv
    case categoryCollection
    case dealsCollection
    case foodCategoryList
    case orderAgain
    case featured
    case offersNearby
    case otherCells
}

//enum HomeCellsList : Int, CaseIterable{
//    case orderStatus = 0
//    case bannerAdv
//    case categoryCollection
//    case dealsCollection
//    case foodCategoryList
//    case otherCells
//}
//
//enum SectionData : Int , CaseIterable{
//    case orderAgain
//    case featured
//    case offersNearby
//}

enum HomeCategoryCellList : Int , CaseIterable{
    
    case food = 0
    case alsaree3Market
    case parcel
    case more
    
    var imageName: String {
            switch self {
            case .food:
                return "foodDish"
            case .alsaree3Market:
                return "market"
            case .parcel:
                return "parcelImage"
            case .more:
                return "hamburgur"
            
                
            }
        }
    
    var title : String{
        switch self {
        case .food:
            return "Food"
        case .alsaree3Market:
            return "Alsaree3 Market"
        case .parcel:
            return "Parcel"
        case .more:
            return "More"
        }
    }
    
}

enum DealsList: Int , CaseIterable{
    case first = 0
    case second
    case third
    case fourth
    case fifth
    
    var title : String{
        switch self {
        case .first :
            return "advertisement"
        case .second :
            return "advertisement"
        case .third :
            return "advertisement"
        case .fourth :
            return "advertisement"
        case .fifth :
            return "advertisement"
        }
    }
}


enum foodCategoryList : Int,CaseIterable{
    case breakfast = 0
    case sweets
    case fishes
    case easternFood
    case sweets1
    case fishes1
    
    var title : String{
        switch self {
        case .breakfast:
            return "Breakfast"
        case .sweets:
            return "Sweets"
        case .fishes:
            return "Fishes"
        case .easternFood:
            return "EasternFood"
        case .fishes1:
            return "Fishes"
        case .sweets1:
            return "Sweets"
        }
    }
    
    var images : String{
        switch self {
        case .breakfast:
            return "breakfast"
        case .sweets:
            return "sweets"
        case .fishes:
            return "fish"
        case .easternFood:
            return "easternfood"
        case .fishes1:
            return "fish"
        case .sweets1:
            return "sweets"
        }
    }
}
