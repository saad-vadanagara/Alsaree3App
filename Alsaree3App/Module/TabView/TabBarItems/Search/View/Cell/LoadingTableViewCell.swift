//
//  LoadingTableViewCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 20/12/23.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        setLabelText(lblrefrence: loadingTitle, lbltext: "Try searching with food emojis today", fontSize: 20,lineHeightMultiple: 0.7)
        LoaderManager.showLoader(in: loadingView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
