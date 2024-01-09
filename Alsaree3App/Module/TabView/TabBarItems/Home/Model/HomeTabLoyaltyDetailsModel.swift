//
//  HomeTabLoyaltyDetailsModel.swift
//  Alsaree3App
//
//  Created by Neosoft on 08/01/24.
//

import Foundation
struct LoyaltyDetailsModel:Codable{
    let success : Bool
    let current_points : Int
    let points_to_next_tier : Int
    let zero_point_image_url : String
    let fineprint_text : String
    let current_tier : String
}
