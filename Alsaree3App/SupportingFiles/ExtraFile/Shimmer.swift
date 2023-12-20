//
//  Shimmer.swift
//  Alsaree3App
//
//  Created by Neosoft on 19/12/23.
//

import Foundation
import ShimmerSwift
import UIKit
class Shimmer{
    static let shared = Shimmer()
    private init() {}
    func addShimmerAnimation(on shimmerView: UIView ) {
        let shimmerView = ShimmeringView(frame: shimmerView.bounds)
        shimmerView.addSubview(shimmerView)
        shimmerView.isShimmering = true
    }
    
}
