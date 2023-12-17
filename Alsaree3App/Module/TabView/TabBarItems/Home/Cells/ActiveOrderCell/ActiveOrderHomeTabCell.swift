//
//  ActiveOrderHomeTabCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 17/12/23.
//

import UIKit


class ActiveOrderHomeTabCell: UITableViewCell {
    
    @IBOutlet weak var contView: UIView!
    @IBOutlet weak var activeOrderlbl: UILabel!
    @IBOutlet weak var orderDescriptionlbl: UILabel!
    @IBOutlet weak var orderProgressimg: UIImageView!
    @IBOutlet weak var detailsBtn: UIButton!
    @IBOutlet weak var subViewWithBorder: UIView!
    @IBOutlet weak var progressView: UIView!
    
    var circularProgressView: CircularProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setUpCircularprogress(currentProgress: 0.3)
        
    }
    
    func setUpCircularprogress(currentProgress: Float){
        
        progressView.layer.cornerRadius = (progressView.bounds.width + 4)/2
        progressView.backgroundColor = UIColor.clear
        circularProgressView = CircularProgressView(frame: progressView.bounds, lineWidth: 2, rounded: true)
        circularProgressView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        circularProgressView.progressColor = ColorConstant.primaryYellowColor
        circularProgressView.trackColor = UIColor.lightGray
        progressView.addSubview(circularProgressView)
        circularProgressView.setProgress(to: currentProgress)
    }
    func setupUI(){
        
        contView.backgroundColor = UIColor.clear
        setLabelText(lblrefrence: activeOrderlbl, lbltext: "Active Order", fontSize: 12 ,alignmentleft: true)
        setLabelText(lblrefrence: orderDescriptionlbl, lbltext: "Order Number - 5th Avenue - Al Furjan Area", fontSize: 10 ,alignmentleft: true)
        orderProgressimg.image = UIImage(named: "orderUpdate")
        setImageOnButton(button: detailsBtn, image: "arrowDown",isSystemImage: false)
        subViewWithBorder.layer.cornerRadius = 10
        subViewWithBorder.layer.borderColor = ColorConstant.primaryYellowColor.cgColor
        subViewWithBorder.layer.borderWidth = 2
        self.backgroundColor = UIColor.clear
    }
    
    @IBAction func onDetailsBtnClick(_ sender: UIButton) {
    }
    
}
