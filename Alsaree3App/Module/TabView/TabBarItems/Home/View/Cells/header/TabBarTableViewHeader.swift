//
//  TabBarTableViewHeader.swift
//  Alsaree3App
//
//  Created by Neosoft on 22/12/23.
//

import UIKit

class TabBarTableViewHeader: UIView {
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        
    }
}
