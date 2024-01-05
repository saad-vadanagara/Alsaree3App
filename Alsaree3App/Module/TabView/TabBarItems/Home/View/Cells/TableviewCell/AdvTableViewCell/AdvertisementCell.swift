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

    func setCollectionview() {
        advCollectionView.delegate = self
        advCollectionView.dataSource = self

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
        advPageControl.numberOfPages = DealsList.allCases.count
    }
  
  

    @IBAction func pageControlAction(_ sender: UIPageControl) {
     
    }
}

extension AdvertisementCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DealsList.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getCell(indexPath: indexPath) as AdvCollectionViewCell
        cell.indexPath = indexPath.row
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
