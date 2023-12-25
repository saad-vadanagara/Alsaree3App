//
//  goldCategoryCardCellTableViewCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 18/12/23.
//

import UIKit

class GoldCategoryCardCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var goldCatCardTitle: UILabel!
    @IBOutlet weak var placeorderLbl: UILabel!
    @IBOutlet weak var goldCaterogryLbl: UILabel!
    @IBOutlet weak var goldCardProgressView: UIProgressView!
    @IBOutlet weak var customProgressView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        let customProgress = CustomProgressView(frame: customProgressView.bounds)
        customProgressView.addSubview(customProgress)
        customProgress.progress = 0.2
    }
    
    func setupUI(){
        setLabelText(lblrefrence: goldCatCardTitle,lbltext: "Your Gold Category Card",fontSize: 16 , isBold: true ,alignmentLeft: true)
        
        let range = NSRange(location: 0, length: 17)
        let coloredText = coloredText(text:"Gold Category Card" , range: range, color: ColorConstant.primaryYellowColor)
        
        setLabelText(lblrefrence: goldCaterogryLbl, lbltext: "You've placed three orders with us. Order more to obtain our Gold Category Card", fontSize: 12,isBold: true , color: ColorConstant.primaryYellowColor,alignmentLeft: true)
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
}
