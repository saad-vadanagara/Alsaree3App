//
//  UIProgressView+Extention.swift
//  Alsaree3App
//
//  Created by Neosoft on 24/12/23.
//

import UIKit

extension UIProgressView{
    func setHeight(_ height: CGFloat) {
        let newFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: height)
        self.frame = newFrame
    }
}
