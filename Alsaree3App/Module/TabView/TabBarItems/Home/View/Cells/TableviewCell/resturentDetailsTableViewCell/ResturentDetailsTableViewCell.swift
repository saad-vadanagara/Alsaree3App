//
//  ResturentDetailsTableViewCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 20/12/23.
//

import UIKit

class ResturentDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var resturentDetailsView: UIView!
    @IBOutlet weak var selectedItemView: UIView!
    @IBOutlet weak var selectedItemOffLbl: UILabel!
    @IBOutlet weak var lowdeleveryView: UIView!
    @IBOutlet weak var lowDeleveryfeelbl: UILabel!
    @IBOutlet weak var resturentTitle: UILabel!
    @IBOutlet weak var resturentImage: UIImageView!
    @IBOutlet weak var resturentFutrCollectionView: UICollectionView!
    
    var resturentDetailsTableViewCellData : Stores?
    var resturentFeatureDate : [featureDetails]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 70, height: 0)
        resturentFutrCollectionView.collectionViewLayout = layout
        
        resturentFutrCollectionView.registerNib(of: FeatureCell.self)
        setDeligate()
        
        resturentDetailsView.layer.borderColor = ColorConstant.borderColorGray.cgColor
        resturentDetailsView.layer.borderWidth = 1
        resturentDetailsView.layer.cornerRadius = 15
    }
    
    func reloadCellData(){
        SDWebImageManager.shared.loadImage(with: resturentDetailsTableViewCellData?.image_url ?? "", into: resturentImage)
        setLabelText(lblrefrence: resturentTitle, lbltext: resturentDetailsTableViewCellData?.name ?? "", fontSize: 20,alignmentLeft:true)
        if resturentDetailsTableViewCellData?.offer == "" {
            setLabelText(lblrefrence: selectedItemOffLbl, lbltext: "Get off on selected items", fontSize: 12,alignmentLeft:true)
        }else{
            setLabelText(lblrefrence: selectedItemOffLbl, lbltext: resturentDetailsTableViewCellData?.offer ?? "Get off on selected items", fontSize: 12,alignmentLeft:true)
        }
        setupFeatureDetails()
//        resturentFutrCollectionView.reloadData()
    }
    
    func setDeligate(){
        resturentFutrCollectionView.delegate = self
        resturentFutrCollectionView.dataSource = self
    }
    
    func setupUI(){
       
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
        
        resturentFutrCollectionView.showsHorizontalScrollIndicator = false
        
        resturentImage.layer.cornerRadius = 15
        resturentImage.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        resturentImage.layer.borderColor = ColorConstant.borderColorGray.cgColor
        resturentImage.layer.borderWidth = 0.2
        resturentImage.clipsToBounds = true
        
    }
    
    func setupFeatureDetails(){
        resturentFeatureDate = [
            featureDetails(featureValue: "500+", image: "Heart",istinted: false),
            featureDetails(featureValue: (String(format: "%.2f", resturentDetailsTableViewCellData?.distance ?? 0.0)+" KM Away"), image: nil, istinted: true),
            featureDetails(featureValue: "\(resturentDetailsTableViewCellData?.delivery_time ?? 0) - \(resturentDetailsTableViewCellData?.delivery_time_max ?? 0) Mins", image:"Location", istinted: true),
            featureDetails(featureValue: " IQD \(resturentDetailsTableViewCellData?.delivery_price_after_discount ?? 0) ", image: "MotorCycle", istinted: true),
            featureDetails(featureValue: "\(String(format: "%.2f", resturentDetailsTableViewCellData?.user_rate ?? 0.0)) Excellent", image: "Star",istinted: true)
            
        ]
    }
    
    
    func applyCornerRadius(to view: UIView, radius: CGFloat) {
        view.clipsToBounds = true
        view.layer.cornerRadius = radius
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    
}

extension ResturentDetailsTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        resturentFeatureDate?.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCell", for: indexPath) as! FeatureCell
        cell.feature = resturentFeatureDate?[indexPath.row]
        cell.fillDetails()
        cell.featurelbl.preferredMaxLayoutWidth = collectionView.frame.width - 16
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: resturentFutrCollectionView.layer.bounds.width, height: resturentFutrCollectionView.layer.bounds.height)
    }
    
    
}
