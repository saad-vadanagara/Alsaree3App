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
}

enum HomeCellsList : Int, CaseIterable{
    case orderStatus = 0
    case bannerAdv
    case categoryCollection
    
}

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
