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
    case yourGoldCategoryCard = "Your Gold Category Card"
    case goldCategoryCard = "Gold Category Card"
    
    case youveplacedthreeorderswithusOrdermoretoobtainour = "You've placed three orders with us. Order more to obtain our "
    
    
    
    
}

enum ButtonTextConstant:String{
    case alFurjanArea = "Al Furjan Area"
    case seeMore = "See More"
    
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
    case resturentTableViewCell = "ResturentTableViewCell"
    case goldCategoryCardCellTableViewCell = "GoldCategoryCardCellTableViewCell"
    case resturentDetailsTableViewCell = "ResturentDetailsTableViewCell"
    case errorStateTableViewCell = "ErrorStateTableViewCell"
    
}

enum AnimationConstant:String{
    case transformrotationz = "transform.rotation.z"
}
