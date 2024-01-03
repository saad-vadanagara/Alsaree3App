import UIKit

class ResturentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var collectionViewTitile: UILabel!
    @IBOutlet weak var seemoreBtn: UIButton!
    @IBOutlet weak var resturentCollectionView: UICollectionView!
    
    var hometabDelegate : HomeTabViewController?
    var featuredData : resturentCollectionViewDetails?
    var isvalueChaged = false
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout!
    
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
        
        centeredCollectionViewFlowLayout = (resturentCollectionView.collectionViewLayout as! CenteredCollectionViewFlowLayout)
        
        centeredCollectionViewFlowLayout.itemSize = CGSize(width: resturentCollectionView.bounds.width * 0.65, height: resturentCollectionView.bounds.height)

        resturentCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        centeredCollectionViewFlowLayout.minimumLineSpacing = 10
        
        resturentCollectionView.showsHorizontalScrollIndicator = false

    }
    
    func setDelegate() {
        resturentCollectionView.delegate = self
        resturentCollectionView.dataSource = self
    }
    
    func registerCell() {
        resturentCollectionView.registerNib(of: ResturentDetailsCollectionViewCell.self)
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
    
    @IBAction func onSeeMoreButton(_ sender: UIButton) {
        hometabDelegate?.seeMoreBtnNavigation()
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


