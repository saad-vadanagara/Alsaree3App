//
//  LoderMnager.swift
//  Alsaree3App
//
//  Created by Neosoft on 20/12/23.
//

import UIKit

class LoaderManager {
    private static let activityIndicator = NVActivityIndicatorAnimationBallClipRotateMultiple()

    class func showLoader(in view: UIView) {
        activityIndicator.setUpAnimation(
            in: view.layer,
            size: CGSize(width: 30, height: 30),
            color: ColorConstant.primaryYellowColor
        )
    }

    class func hideLoader(in view: UIView) {
        // Remove the loader from the layer
        view.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
}
