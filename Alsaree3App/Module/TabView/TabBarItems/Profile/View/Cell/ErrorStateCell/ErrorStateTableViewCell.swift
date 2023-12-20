//
//  ErrorStateTableViewCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 19/12/23.
//

import UIKit

class ErrorStateTableViewCell: UITableViewCell {

    @IBOutlet private weak var errorImg: UIImageView!
    @IBOutlet private weak var errorlbl: UILabel!
    @IBOutlet private weak var tryAgainButton: UIButton!
    
    var isInternetError: Bool = false {
        didSet {
            setupUI()
        }
    }
    
    var isApiError: Bool = false {
        didSet {
            setupUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        setupUI()
    }
    
    func setupUI() {
        if isInternetError {
            errorImg.image = UIImage(named: "nointernet")
//            errorlbl.text = "Could not connect to the internet. Please check your network"
            setLabelText(lblrefrence: errorlbl, lbltext: "Could not connect to the internet. Please check your network", fontSize: 12)
            setButtonText(button: tryAgainButton, label: "Try again", color: ColorConstant.primaryYellowColor, size: 13)
        } else if isApiError {
            errorImg.image = UIImage(named: "apierror")
            setLabelText(lblrefrence: errorlbl, lbltext: "API Error", fontSize: 12)
            setButtonText(button: tryAgainButton, label: "Try again", color: ColorConstant.primaryYellowColor, size: 13)
        }
        
    }
    
}
