//
//  ResturentDetailsCollectionViewCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 18/12/23.
//

import UIKit

class ResturentDetailsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var resturentDetailsView: UIView!
    @IBOutlet weak var selectedItemView: UIView!
    @IBOutlet weak var selectedItemOffLbl: UILabel!
    @IBOutlet weak var lowdeleveryView: UIView!
    @IBOutlet weak var lowDeleveryfeelbl: UILabel!
    @IBOutlet weak var resturentTitle: UILabel!
    @IBOutlet weak var resturentImage: UIImageView!
    @IBOutlet weak var resturentFeatureCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        resturentFeatureCollectionView.collectionViewLayout = layout
        
        resturentFeatureCollectionView.registerNib(of: FeatureCell.self)
        setDeligate()
        
        resturentDetailsView.layer.borderColor = ColorConstant.borderColorGray.cgColor
        resturentDetailsView.layer.borderWidth = 1
        resturentDetailsView.layer.cornerRadius = 15
        
    
    }
    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        
//        self.resturentFeatureCollectionView.frame = self.bounds
//        self.resturentFeatureCollectionView.layoutIfNeeded()
//        return self.resturentFeatureCollectionView.contentSize
//    }
    
    func setDeligate(){
        resturentFeatureCollectionView.delegate = self
        resturentFeatureCollectionView.dataSource = self
    }
    
    func setupUI(){
        let imageSize = CGSize(width: 10, height: 10)
        
        resturentImage.image = UIImage(named: "resturentImage")
        setLabelText(lblrefrence: resturentTitle, lbltext: "Ultimate Chicken - Wraps, Plates",fontSize: 20)
        
        lowdeleveryView.backgroundColor = UIColor.white
        lowdeleveryView.layer.borderColor = ColorConstant.borderColorGray.cgColor
        lowdeleveryView.layer.borderWidth = 0.5
        applyCornerRadius(to: lowdeleveryView, radius: 5)
    
        setLabelText(lblrefrence: selectedItemOffLbl, lbltext: "Get 20% off selected items", fontSize: 12,color: ColorConstant.whitecolor)
        selectedItemView.backgroundColor = ColorConstant.primaryYellowColor
        applyCornerRadius(to: selectedItemView, radius: 5)
        
        setLabelText(lblrefrence: lowDeleveryfeelbl, lbltext: "Low delivery fee", fontSize: 12)
        
        resturentFeatureCollectionView.showsHorizontalScrollIndicator = false
        
    }
    
    
    func applyCornerRadius(to view: UIView, radius: CGFloat) {
        view.clipsToBounds = true
        view.layer.cornerRadius = radius
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    
}
let userPreferences = [
    featureDetails(featureValue: "500+", image: "Heart",istinted: false),
    featureDetails(featureValue: "2.5 KM Away", image: nil,istinted: true),
    featureDetails(featureValue: "25 - 45 Mins" , image: "Location",istinted: true),
    featureDetails(featureValue: "IQD 1000", image: "MotorCycle",istinted: true),
    featureDetails(featureValue: "3.4 Excellent", image: "Star",istinted: true)
]

extension ResturentDetailsCollectionViewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userPreferences.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCell", for: indexPath) as! FeatureCell
        cell.feature = userPreferences[indexPath.row]
        cell.fillDetails()
        cell.featurelbl.preferredMaxLayoutWidth = collectionView.frame.width - 16
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: resturentFeatureCollectionView.bounds.width, height: resturentFeatureCollectionView.bounds.height)
    }
    
    
}
