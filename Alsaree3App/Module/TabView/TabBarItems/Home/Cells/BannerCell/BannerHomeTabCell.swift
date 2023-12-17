//
//  BannerHomeTabCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 17/12/23.
//

import UIKit

class BannerHomeTabCell: UITableViewCell {

    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUi()
        self.backgroundColor = UIColor.clear
    }
    
    func setupUi(){
        bannerImageView.image = UIImage(named: "bannerAdvertisement")
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.layer.cornerRadius = 11
    }
    
}
