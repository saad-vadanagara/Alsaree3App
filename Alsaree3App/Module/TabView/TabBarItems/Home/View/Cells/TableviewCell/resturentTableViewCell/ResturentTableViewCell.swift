//
//  ResturentTableViewCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 18/12/23.
//

import UIKit

class ResturentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var collectionViewTitile: UILabel!
    @IBOutlet weak var seemoreBtn: UIButton!
    @IBOutlet weak var resturentCollectionView: UICollectionView!
    
    var featuredData : resturentCollectionViewDetails?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setDeligate()
        registerCell()
        resturentCollectionView.isPagingEnabled = true
        resturentCollectionView.showsHorizontalScrollIndicator = false
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        resturentCollectionView.collectionViewLayout = flowLayout
        resturentCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        resturentCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
    }
    
    
    func setupUI(){
        setLabelText(lblrefrence: collectionViewTitile, lbltext:featuredData?.name ?? "" , fontSize: 20,isBold: true)
        setButtonText(button: seemoreBtn, label: "See More",color: ColorConstant.primaryYellowColor, size: 14,isUnderline: true)
        
    }
    
    func setDeligate(){
        resturentCollectionView.delegate = self
        resturentCollectionView.dataSource = self
        resturentCollectionView.delegate = self
    }
    
    func registerCell(){
        resturentCollectionView.registerNib(of: ResturentDetailsCollectionViewCell.self)
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}

extension ResturentTableViewCell : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        featuredData?.details.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getCell(indexPath: indexPath) as ResturentDetailsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.75, height: collectionView.bounds.height)
    }
    
}




