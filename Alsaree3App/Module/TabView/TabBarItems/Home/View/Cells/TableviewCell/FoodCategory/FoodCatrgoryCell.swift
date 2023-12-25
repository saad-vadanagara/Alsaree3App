//
//  FoodCatrgoryCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 17/12/23.
//

import UIKit

class FoodCatrgoryCell: UITableViewCell {

    @IBOutlet weak var foodCategoryCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDelegate()
        registerCell()
        setupUI()
    }
    
    
    
    func setupDelegate(){
        foodCategoryCollectionView.delegate = self
        foodCategoryCollectionView.dataSource = self
    }
    
    func registerCell(){
        foodCategoryCollectionView.registerNib(of: FoodCatCollectionViewCell.self)
    }
    
    func setupUI(){
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        foodCategoryCollectionView.collectionViewLayout = flowLayout
        foodCategoryCollectionView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        
        foodCategoryCollectionView.showsHorizontalScrollIndicator = false
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        self.foodCategoryCollectionView.frame = self.bounds
        self.foodCategoryCollectionView.layoutIfNeeded()
        return self.foodCategoryCollectionView.contentSize
    }

    
}

extension FoodCatrgoryCell : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodCategoryList.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getCell(indexPath: indexPath) as FoodCatCollectionViewCell
        cell.indexpath = indexPath.row
        cell.setupUI()
        return cell
    }
    
}
extension FoodCatrgoryCell:UICollectionViewDelegate{
    
}

extension FoodCatrgoryCell : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (foodCategoryCollectionView.bounds.width )/4 , height: (foodCategoryCollectionView.bounds.height))
    }
}
