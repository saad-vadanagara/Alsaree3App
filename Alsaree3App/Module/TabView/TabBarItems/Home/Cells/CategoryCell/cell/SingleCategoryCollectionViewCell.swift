//
//  SingleCategoryCollectionViewCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 17/12/23.
//

import UIKit

class SingleCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    var indexPath = Int()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupUI(){
        categoryImg.image = UIImage(named: HomeCategoryCellList(rawValue: indexPath)?.imageName ?? "")
        if let title = HomeCategoryCellList(rawValue: indexPath)?.title{
            setLabelText(lblrefrence: categoryTitle, lbltext: title , fontSize: 10)
        }
        self.backgroundColor = UIColor.clear
        parentView.layer.cornerRadius = 10
        parentView.layer.borderColor = ColorConstant.borderColorGray.cgColor
        parentView.layer.borderWidth = 1
        parentView.clipsToBounds = true
        parentView.backgroundColor = ColorConstant.whitecolor
        
    }
    
    func setSelected(){
        parentView.layer.borderColor = ColorConstant.borderColorYellow.cgColor
    }
    
    

}
