//
//  AdvCollectionViewCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 17/12/23.
//

import UIKit

class AdvCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var advCollectionView: UIImageView!
    var indexPath = Int()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }
    
    func setupUI(){
        advCollectionView.image = UIImage(named: DealsList(rawValue: indexPath)?.title ?? "")
        parentView.layer.cornerRadius = 10
        parentView.backgroundColor = ColorConstant.borderColorGray

        
    }
}
