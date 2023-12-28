import UIKit

class ResturentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var collectionViewTitile: UILabel!
    @IBOutlet weak var seemoreBtn: UIButton!
    @IBOutlet weak var resturentCollectionView: UICollectionView!
    
    var featuredData : resturentCollectionViewDetails?
    var indexOfCellBeforeDragging: Int = 0
    var isvalueChaged = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setDelegate()
        registerCell()
        configureCollectionViewLayout()
        resturentCollectionView.decelerationRate = .fast
    }
    
    func setupUI(){
        setLabelText(lblrefrence: collectionViewTitile, lbltext: featuredData?.name ?? "Offers Nearby", fontSize: 20,isBold: true)
        setButtonText(button: seemoreBtn, label: ButtonTextConstant.seeMore.rawValue,color: ColorConstant.borderColorYellow, size: 14,isUnderline: true)
    }
    
    func configureCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10 // Adjust the spacing between cells as needed
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // Adjust the section inset as needed
        flowLayout.itemSize = CGSize(width: resturentCollectionView.bounds.width * 0.65, height: resturentCollectionView.bounds.height)
        flowLayout.minimumInteritemSpacing = 0
        resturentCollectionView.collectionViewLayout = flowLayout
        
        resturentCollectionView.showsHorizontalScrollIndicator = false
        resturentCollectionView.isPagingEnabled = false
        
        resturentCollectionView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
    }
    
    func setDelegate() {
        resturentCollectionView.delegate = self
        resturentCollectionView.dataSource = self
    }
    
    func registerCell() {
        resturentCollectionView.registerNib(of: ResturentDetailsCollectionViewCell.self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.resturentCollectionView.frame = self.bounds
        self.resturentCollectionView.layoutIfNeeded()
        
        if isvalueChaged{
            return self.resturentCollectionView.contentSize
        }else{
            resturentCollectionView.contentSize.height += 50
            isvalueChaged = true
            return self.resturentCollectionView.contentSize
        }
    }
    
    func calculateSectionInset(forCollectionViewLayout collectionViewLayout: UICollectionViewFlowLayout, numberOfCells: Int) -> CGFloat {
        let inset = (collectionViewLayout.collectionView!.frame.width) / CGFloat(numberOfCells)
        return inset
    }
    
    func configureCollectionViewLayoutItemSize(forCollectionViewLayout collectionViewLayout: UICollectionViewFlowLayout) {
        
        let inset: CGFloat = calculateSectionInset(forCollectionViewLayout: collectionViewLayout, numberOfCells: 5)
        
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: inset/4, bottom: 0, right: inset/4)
        
        collectionViewLayout.itemSize = CGSize(width: collectionViewLayout.collectionView!.frame.size.width - inset / 2, height: collectionViewLayout.collectionView!.frame.size.height)
        collectionViewLayout.collectionView?.reloadData()
    }
    
    func indexOfMajorCell(in collectionViewLayout: UICollectionViewFlowLayout) -> Int {
        let itemWidth = collectionViewLayout.itemSize.width
        let proportionalLayout = collectionViewLayout.collectionView!.contentOffset.x / itemWidth
        return Int(round(proportionalLayout))
    }
    
    
    func setIndexOfCellBeforeStartingDragging(indexOfMajorCell: Int) {
        indexOfCellBeforeDragging = indexOfMajorCell
    }
    
    func animateCellSelection(at indexPath: IndexPath) {
        let cell = resturentCollectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.3, animations: {
            cell?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.3) {
                cell?.transform = .identity
            }
        }
    }
    
}

extension ResturentTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredData?.details.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getCell(indexPath: indexPath) as ResturentDetailsCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            animateCellSelection(at: indexPath)
        }
}

extension ResturentTableViewCell:UIScrollViewDelegate{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        
        let indexOfMajorCell = indexOfMajorCell(in: resturentCollectionView.collectionViewLayout as! UICollectionViewFlowLayout)
        handleDraggingWillEndForScrollView(scrollView, inside: resturentCollectionView.collectionViewLayout as! UICollectionViewFlowLayout, withVelocity: velocity, usingIndexOfMajorCell: indexOfMajorCell)
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let indexOfMajorCell = indexOfMajorCell(in: resturentCollectionView.collectionViewLayout as! UICollectionViewFlowLayout)
        setIndexOfCellBeforeStartingDragging(indexOfMajorCell: indexOfMajorCell)
    }
    
    func handleDraggingWillEndForScrollView(_ scrollView: UIScrollView, inside collectionViewLayout: UICollectionViewFlowLayout, withVelocity velocity: CGPoint, usingIndexOfMajorCell indexOfMajorCell: Int) {
            let indexOfMajorCell = indexOfMajorCell

            let swipeVelocityThreshold: CGFloat = 0.5
            let majorCellIsTheCellBeforeDragging = indexOfMajorCell == indexOfCellBeforeDragging
            let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < (featuredData?.details.count ?? 0) && velocity.x > swipeVelocityThreshold
            let hasEnoughVelocityToSlideToThePreviousCell = ((indexOfCellBeforeDragging - 1) >= 0) && (velocity.x < -swipeVelocityThreshold)

            let didUseSwipeToSkipCell = majorCellIsTheCellBeforeDragging && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)

            if didUseSwipeToSkipCell {
                let snapToIndex = indexOfCellBeforeDragging + (hasEnoughVelocityToSlideToTheNextCell ? 1 : -1)
                let toValue = collectionViewLayout.itemSize.width * CGFloat(snapToIndex)

                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity.x, options: .allowUserInteraction, animations: {
                    scrollView.contentOffset = CGPoint(x: toValue, y: 0)
                    scrollView.layoutIfNeeded()
                }, completion: nil)
            } else {
                let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
                collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    
}
