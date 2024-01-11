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
    
    func setButtonText(button: UIButton, label: String, color: UIColor = ColorConstant.blackcolor, size: Int, font_Family: String = FontConstant.regular.rawValue, isBold: Bool = false, isUnderline: Bool = false, borderColor: UIColor = UIColor.clear) {
        
        var attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color
        ]
        
        attributes[.font] = isBold ? UIFont(name: FontConstant.bold.rawValue, size: CGFloat(size)) : UIFont(name: font_Family, size: CGFloat(size))
        
        if isUnderline {
            // Add underline attribute
            let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
            attributes.merge(underlineAttribute) { $1 }
        }
        
        let attributedText = NSAttributedString(string: label, attributes: attributes)
        
        button.layer.borderColor = borderColor.cgColor
        button.setAttributedTitle(attributedText, for: .normal)
    }
    
    func setLabelText(lblrefrence: UILabel, lbltext: String, fontSize: Int, font_Family: String = FontConstant.regular.rawValue, isBold: Bool = false, color: UIColor = UIColor.black, alignmentLeft: Bool = false, lineHeightMultiple: CGFloat? = nil) {
        lblrefrence.text = lbltext
        
        if let font = isBold ? UIFont.boldSystemFont(ofSize: CGFloat(fontSize)) : UIFont(name: font_Family, size: CGFloat(fontSize)) {
            let attributedString = NSMutableAttributedString(string: lbltext)
            
            if let lineHeightMultiple = lineHeightMultiple {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineHeightMultiple = lineHeightMultiple
                attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            }
            
            lblrefrence.attributedText = attributedString
            lblrefrence.font = font
        }
        
        lblrefrence.textColor = color
        
        if alignmentLeft {
            lblrefrence.textAlignment = .left
        } else {
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
    
    
    func setImageOnButton(button : UIButton , image : String , isSystemImage : Bool = false , isAspectFill : Bool = false){
        if isSystemImage {
            button.setImage(UIImage(systemName: image), for: .normal)
        } else {
            button.setImage(UIImage(named: image), for: .normal)
        }
        
        if isAspectFill {
            button.imageView?.contentMode = .scaleAspectFill
            button.clipsToBounds = true
        }
    }
    
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: UIScreen.main.bounds.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func applyShadow(to view: UIView) {
        
    }
    
    func coloredText(text: String, range: NSRange, color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        if let cairoFont = UIFont(name: FontConstant.bold.rawValue, size: 12) {
            attributedString.addAttribute(.font, value: cairoFont, range: range)
        } else {
            print("Error loading Cairo-Bold font")
        }
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        return attributedString
    }
  
    
}


