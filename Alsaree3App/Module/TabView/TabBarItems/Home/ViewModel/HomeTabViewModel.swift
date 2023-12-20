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
    
}
