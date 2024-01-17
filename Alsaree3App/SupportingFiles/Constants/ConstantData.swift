//
//  ConstantData.swift
//  Alsaree3App
//
//  Created by Neosoft on 16/01/24.
//

import Foundation

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
