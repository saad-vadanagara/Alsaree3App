//
//  AdvertisementCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 17/12/23.
//

import UIKit

class AdvertisementCell: UITableViewCell {

    // MARK: IBOutlet
    @IBOutlet weak var advCollectionView: UICollectionView!
    @IBOutlet weak var advPageControl: UIPageControl!
    
    var advertisementBannerData : [Banner]?
    var isHeigthChnaged = false
    
    // MARK: Local Variables
    var currentscrollIndex = 1
    var contentOffset = CGPoint()
    var timer : Timer?
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCollectionview()
        setupPageControl()
        self.backgroundColor = UIColor.clear
    }
    
    func reloadData(){
        advCollectionView.reloadData()
        setupPageControl()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        self.advCollectionView.frame = self.bounds
        self.advCollectionView.layoutIfNeeded()
        
        if isHeigthChnaged{
            return self.advCollectionView.contentSize
        }else{
            advCollectionView.contentSize.height += 50
            isHeigthChnaged = true
            return self.advCollectionView.contentSize
        }
        
    }

    func setCollectionview() {
        advCollectionView.delegate = self
        advCollectionView.dataSource = self
        
        advCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        centeredCollectionViewFlowLayout = (advCollectionView.collectionViewLayout as! CenteredCollectionViewFlowLayout)
        centeredCollectionViewFlowLayout.itemSize = CGSize(width: advCollectionView.bounds.width * 0.9, height: advCollectionView.bounds.height)

        advCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        centeredCollectionViewFlowLayout.minimumLineSpacing = 23
        
        advCollectionView.showsHorizontalScrollIndicator = false


        advCollectionView.registerNib(of: AdvCollectionViewCell.self)
        advCollectionView.backgroundColor = UIColor.clear
        advCollectionView.showsHorizontalScrollIndicator = false
        advCollectionView.contentInset = UIEdgeInsets.zero
    }

    func setupPageControl() {
        advPageControl.currentPageIndicatorTintColor = ColorConstant.primaryYellowColor
        advPageControl.pageIndicatorTintColor = ColorConstant.borderColorGray
        advPageControl.currentPage = 0
        advPageControl.numberOfPages = advertisementBannerData?.count ?? 5
    }

    @IBAction func pageControlAction(_ sender: UIPageControl) {
     
    }
}

extension AdvertisementCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        advertisementBannerData?.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getCell(indexPath: indexPath) as AdvCollectionViewCell
        cell.indexPath = indexPath.row
        cell.imageUrl = advertisementBannerData?[indexPath.row].image_url ?? ""
        cell.setupUI()
        return cell
    }
    
}


extension AdvertisementCell : UICollectionViewDelegateFlowLayout{
    
  
}

extension AdvertisementCell :UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let width = scrollView.frame.width
            let currentPage = Int((scrollView.contentOffset.x + width / 2) / width)
            advPageControl.currentPage = currentPage
        }
}
