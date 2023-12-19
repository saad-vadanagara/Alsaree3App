//
//  UIImage + Extention.swift
//  Alsaree3App
//
//  Created by Neosoft on 17/12/23.
//

import UIKit
extension UIImage {
    func resizedImage(with size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
}
