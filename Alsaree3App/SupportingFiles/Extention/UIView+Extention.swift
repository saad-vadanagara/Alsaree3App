//
//  UIView+Extention.swift
//  Alsaree3App
//
//  Created by Neosoft on 15/12/23.
//

import Foundation
import UIKit

extension UIView{
    func setButtonText(button:UIButton,label:String,color:UIColor = ColorConstant
        .blackcolor,size:Int,font_Family:String = FontConstant.regular.rawValue ,isbold:Bool = false , borderColor : UIColor = UIColor.clear){
            
            var attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: color
            ]
            
            attributes[.font] = isbold ? UIFont(name: FontConstant.bold.rawValue, size: CGFloat(size)) : UIFont(name: font_Family, size: CGFloat(size))
            
            let attributedText = NSAttributedString(string: label, attributes: attributes)
            button.layer.borderColor = borderColor.cgColor
            button.setAttributedTitle(attributedText, for: .normal)
        }
    
    func setLabelText(lblrefrence: UILabel,lbltext:String,fontSize:Int,font_Family:String = FontConstant.regular.rawValue,isBold:Bool = false ,color:UIColor = UIColor.black , alignmentleft : Bool = false ){
        lblrefrence.text = lbltext
        lblrefrence.font = isBold ? UIFont.boldSystemFont(ofSize: CGFloat(fontSize)) : UIFont(name: font_Family, size: CGFloat(fontSize))
        lblrefrence.textColor = color
        if alignmentleft{
            lblrefrence.textAlignment = .left
        }else{
            lblrefrence.textAlignment = .center
        }
    }
    
    
    func setButtonTextWithImage(button: UIButton, image: String, text: String, textColor: UIColor = UIColor.black, fontSize: CGFloat, imageSize: CGSize){
        
        // set Button Attributed text
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: textColor,
            .font: UIFont(name: FontConstant.regular.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        ]
        
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        button.setAttributedTitle(attributedText, for: .normal)
        
        
        // set button image
        if let customImage = UIImage(named: image, in: nil, with: nil)?.resizedImage(with: imageSize) {
            button.setImage(customImage, for: .normal)
        }
        
        // Set semantic content attribute and content horizontal alignment
        button.semanticContentAttribute = .forceRightToLeft
        button.contentHorizontalAlignment = .trailing
        
        // Adjust the position of the image
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -10) // Adjust the right inset as needed
    }
    
    func setImage(imageView: UIImageView, imageName: String, isAspectFit: Bool = true, isSystemImage: Bool = false) {
        if isSystemImage {
            imageView.image = UIImage(systemName: imageName)
        } else {
            imageView.image = UIImage(named: imageName)
        }
        
        if isAspectFit {
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView.contentMode = .scaleToFill
        }
    }
    
    func setCircleWithBorderColor(imageView:UIImageView , borderColor : UIColor , borderWidth : Int){
        imageView.layer.cornerRadius = (imageView.bounds.width) / 2
        imageView.layer.borderColor = borderColor.cgColor
        imageView.layer.borderWidth = CGFloat(borderWidth)
    }
    
    
    
    
}

extension UIImage {
    func resizedImage(with size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
}

