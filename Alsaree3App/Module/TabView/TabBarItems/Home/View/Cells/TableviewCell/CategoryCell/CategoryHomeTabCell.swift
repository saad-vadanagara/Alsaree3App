//
//  CategoryHomeTabCell.swift
//  Alsaree3App
//
//  Created by Neosoft on 17/12/23.
//

import UIKit

class CategoryHomeTabCell: UITableViewCell {

    // MARK: IBOutlet
    @IBOutlet weak var homeCategoryCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollectionviewDeligate()
        registerCollectionviewCell()
        setupCollectionViewUI()
    }
    
    func setCollectionviewDeligate(){
        homeCategoryCollectionView.delegate = self
        homeCategoryCollectionView.dataSource = self
    }
    
    func registerCollectionviewCell(){
        homeCategoryCollectionView.registerNib(of: SingleCategoryCollectionViewCell.self)
    }
    
    func setupCollectionViewUI(){
        homeCategoryCollectionView.backgroundColor = UIColor.clear
        
        // Setting Collectionview ScrollDirection
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        homeCategoryCollectionView.collectionViewLayout = layout
        
        // setting transprent backgroung
        homeCategoryCollectionView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
    }

    
}

extension CategoryHomeTabCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HomeCategoryCellList.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getCell(indexPath: indexPath) as SingleCategoryCollectionViewCell
        cell.indexPath = indexPath.row
        cell.setupUI()
        return cell
    }
    
}

extension CategoryHomeTabCell : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.getCell(indexPath: indexPath) as SingleCategoryCollectionViewCell
        cell.isSelected.toggle()
    }
}

extension CategoryHomeTabCell : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 30)/4 , height: collectionView.bounds.height )
    }
}
