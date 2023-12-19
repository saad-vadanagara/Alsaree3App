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


    override func awakeFromNib() {
        super.awakeFromNib()
        setCollectionview()
        setupPageControl()
        startTimer()
        self.backgroundColor = UIColor.clear
    }

    func setCollectionview() {
        advCollectionView.delegate = self
        advCollectionView.dataSource = self

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        advCollectionView.collectionViewLayout = flowLayout

        advCollectionView.registerNib(of: AdvCollectionViewCell.self)
        advCollectionView.backgroundColor = UIColor.clear
        advCollectionView.showsHorizontalScrollIndicator = false
        advCollectionView.isPagingEnabled = true
        advCollectionView.contentInset = UIEdgeInsets.zero
    }

    func setupPageControl() {
        advPageControl.currentPageIndicatorTintColor = ColorConstant.primaryYellowColor
        advPageControl.pageIndicatorTintColor = ColorConstant.borderColorGray
        advPageControl.currentPage = 0
        advPageControl.numberOfPages = DealsList.allCases.count
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }
    
    @objc func scrollToNextItem() {
        let cellSize = CGSize(width: self.advCollectionView.layer.bounds.width, height: self.advCollectionView.frame.height)
        
        if currentscrollIndex >= DealsList.allCases.count {
            advPageControl.currentPage = 0
            currentscrollIndex = 0
            advCollectionView.setContentOffset(CGPoint(x: 0, y: contentOffset.y), animated: true)
        } else {
            advPageControl.currentPage = currentscrollIndex
            let targetOffsetX = (contentOffset.x + (cellSize.width+10) * CGFloat(currentscrollIndex))
            advCollectionView.setContentOffset(CGPoint(x: (targetOffsetX), y: contentOffset.y), animated: true)
            currentscrollIndex += 1
        }
    }
    
  

    @IBAction func pageControlAction(_ sender: UIPageControl) {
        let presentSelected = sender.currentPage
        let cellSize = CGSize(width: self.advCollectionView.frame.width, height: self.advCollectionView.frame.height)
        
        advPageControl.currentPage = presentSelected
        currentscrollIndex = presentSelected
        
        let targetOffsetX = cellSize.width * CGFloat(presentSelected)
        advCollectionView.setContentOffset(CGPoint(x: targetOffsetX, y: contentOffset.y), animated: true)
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: advCollectionView.bounds.width, height: advCollectionView.bounds.height)
    }
}

extension AdvertisementCell :UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + width / 2) / width)
        advPageControl.currentPage = currentPage
    }
}
