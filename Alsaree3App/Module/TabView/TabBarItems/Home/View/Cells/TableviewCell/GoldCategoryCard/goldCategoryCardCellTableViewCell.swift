//
//  goldCategoryCardCellTableViewCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 18/12/23.
//

import UIKit

class goldCategoryCardCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var goldCatCardTitle: UILabel!
    @IBOutlet weak var placeorderLbl: UILabel!
    @IBOutlet weak var goldCaterogryLbl: UILabel!
    @IBOutlet weak var goldCardProgressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupUI(){
        setLabelText(lblrefrence: goldCaterogryLbl, lbltext: "Your Gold Category Card", fontSize: 16)
        setLabelText(lblrefrence: placeorderLbl, lbltext: "You've placed three orders with us. Order more to obtain our", fontSize: 12 )
        setLabelText(lblrefrence: goldCaterogryLbl, lbltext: "Gold Category Card", fontSize: 12,isBold: true , color: ColorConstant.primaryYellowColor)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
