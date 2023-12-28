//
//  ResturentDetailsCollectionViewCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 18/12/23.
//

import UIKit

class ResturentDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var resturentInternelView: UIView!
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
        setDeligate()
        setupCollectionView()
        registerCell()
        drawTriangleforSelectedView()
        drawTriangleforlowdeleveryView()
    }
    
    func setupCollectionView(){
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        resturentFeatureCollectionView.collectionViewLayout = layout
    }
    
    func registerCell(){
        resturentFeatureCollectionView.registerNib(of: FeatureCell.self)
    }
    
    func setDeligate(){
        resturentFeatureCollectionView.delegate = self
        resturentFeatureCollectionView.dataSource = self
    }
    
    func drawTriangleforSelectedView() {
        let triangleLayer = CAShapeLayer()
        let trianglePath = UIBezierPath()
        
        // Starting point for the path (the bottom left of the triangle)
        let startX = selectedItemView.frame.minX
        let startY = selectedItemView.frame.maxY
        
        // Move to starting point
        trianglePath.move(to: CGPoint(x: startX, y: startY-13))
        trianglePath.addLine(to: CGPoint(x: startX+10 , y: startY-13))
        trianglePath.addLine(to: CGPoint(x: startX+10, y: startY))
        trianglePath.close()
        
        // Configure the layer
        triangleLayer.path = trianglePath.cgPath
        triangleLayer.fillColor = UIColor(red: 0.72, green: 0.39, blue: 0.14, alpha: 1).cgColor
        triangleLayer.zPosition = -1
        self.layer.addSublayer(triangleLayer)
    }
    
    func drawTriangleforlowdeleveryView() {
        let triangleLayer = CAShapeLayer()
        let trianglePath = UIBezierPath()
        
        // Starting point for the path (the bottom left of the triangle)
        let startX = lowdeleveryView.frame.minX
        let startY = lowdeleveryView.frame.maxY
        
        // Move to starting point
        trianglePath.move(to: CGPoint(x: startX, y: startY-26))
        trianglePath.addLine(to: CGPoint(x: startX+10 , y: startY-26))
        trianglePath.addLine(to: CGPoint(x: startX+10, y: startY-10))
        trianglePath.close()
        
        // Configure the layer
        triangleLayer.path = trianglePath.cgPath
        triangleLayer.fillColor = UIColor(red: 0.67, green: 0.66, blue: 0.66, alpha: 1).cgColor
        triangleLayer.zPosition = -1
        self.layer.addSublayer(triangleLayer)
    }

    func setupUI(){
        
        // setting resturent Image
        resturentImage.image = UIImage(named: "resturntIamgewithsouth")
        
        //setting the label text
        setLabelText(lblrefrence: resturentTitle, lbltext: "Ultimate Chicken - Wraps, Plates",fontSize: 20)
        
        // setup low delevery sticker
        lowdeleveryView.backgroundColor = UIColor.white
        lowdeleveryView.layer.borderColor = ColorConstant.borderColorGray.cgColor
        lowdeleveryView.layer.borderWidth = 0.5
        setLabelText(lblrefrence: lowDeleveryfeelbl, lbltext: "Low delivery fee", fontSize: 12)
        applyCornerRadius(to: lowdeleveryView, radius: 5)
        
        // setup offer stricker
        setLabelText(lblrefrence: selectedItemOffLbl, lbltext: "Get 20% off selected items", fontSize: 12,color: ColorConstant.whitecolor)
        selectedItemView.backgroundColor = ColorConstant.primaryYellowColor
        applyCornerRadius(to: selectedItemView, radius: 5)
        
        // hide the scroll indicator
        resturentFeatureCollectionView.showsHorizontalScrollIndicator = false
        
        // setup rsturent details view
        resturentInternelView.layer.borderColor = ColorConstant.borderColorGray.cgColor
        resturentInternelView.layer.borderWidth = 1
        resturentInternelView.layer.cornerRadius = 15
        resturentInternelView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        resturentInternelView.clipsToBounds = true
        
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

extension ResturentDetailsCollectionViewCell : UICollectionViewDataSource{
    
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
}

extension ResturentDetailsCollectionViewCell:UICollectionViewDelegate{
    
}

extension ResturentDetailsCollectionViewCell : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: resturentFeatureCollectionView.bounds.width, height: resturentFeatureCollectionView.bounds.height)
    }
    
}
