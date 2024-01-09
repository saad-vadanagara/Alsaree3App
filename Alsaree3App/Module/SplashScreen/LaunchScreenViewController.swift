//
//  LaunchScreenViewController.swift
//  Alsaree3App
//
//  Created by Neosoft on 05/01/24.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

//
//
//
//func numberOfSections(in tableView: UITableView) -> Int {
//    return viewModel.getTableViewCount() == 1 ? 1 : viewModel.HomeTabData.count
//}
//
//
//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    if viewModel.getTableViewCount() == 1 {
//        return 1
//    } else {
//        guard let sectionData = viewModel.HomeTabData[section] as? [any CaseIterable] else {
//            return 0
//        }
//        if section == 1{
//            return sectionData.count
//        }
//        return sectionData.count
//    }
//}
//
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    
//    if viewModel.getTableViewCount() == 1 {
//        let loadingCell = tableView.dequeueReusableCell(withIdentifier: "LoadingTableViewCell", for: indexPath) as! LoadingTableViewCell
//        loadingCell.selectionStyle = .none
//        return loadingCell
//    }
//    
//    let sectionData = viewModel.HomeTabData[indexPath.section]
//    // Handle cells based on section type
//    switch sectionData {
//    case let aboveSection as [SectionAboveHeader]:
//        let cellType = aboveSection[indexPath.row]
//        switch cellType {
//        case .orderStatus:
//            if true{
//                let cell = tableView.getCell(identifier: CellConstant.activeOrderHomeTabCell.rawValue) as! ActiveOrderHomeTabCell
//                
//                cell.selectionStyle = .none
//                return cell
//            }else{
//                let cell = tableView.getCell(identifier: "GoldCategoryCardCellTableViewCell") as! GoldCategoryCardCellTableViewCell
//                cell.selectionStyle = .none
//                return cell
//            }
//        case .bannerAdv:
//            let cell = tableView.getCell(identifier: CellConstant.bannerHomeTabCell.rawValue) as! BannerHomeTabCell
//            cell.selectionStyle = .none
//            return cell
//        }
//        
//    case let belowHeaderSection as [SectionBelowScrollingHeader]:
//        
//        let cellType = belowHeaderSection[indexPath.row]
//        
//        switch cellType {
//        case .dealsCollection:
//            let cell = tableView.getCell(identifier: CellConstant.advertisementCell.rawValue) as! AdvertisementCell
//            cell.selectionStyle = .none
//            return cell
//        case .foodCategoryList:
//            let cell = tableView.getCell(identifier: CellConstant.foodCatrgoryCell.rawValue) as! FoodCatrgoryCell
//            cell.selectionStyle = .none
//            return cell
//            
//        case .orderAgain:
//            let cell = tableView.getCell(identifier: "ResturentTableViewCell") as! ResturentTableViewCell
//            cell.featuredData = viewModel.resturentCollectionViewData[0]
//            cell.hometabDelegate = self
//            cell.selectionStyle = .none
//            return cell
//        case .featured:
//            let cell = tableView.getCell(identifier: "ResturentTableViewCell") as! ResturentTableViewCell
//            cell.featuredData = viewModel.resturentCollectionViewData[1]
//            cell.selectionStyle = .none
//            return cell
//        case .offersNearby:
//            let cell = tableView.getCell(identifier: "ResturentTableViewCell") as! ResturentTableViewCell
//            cell.featuredData = viewModel.resturentCollectionViewData[1]
//            cell.selectionStyle = .none
//            return cell
//        default:
//            let cell = tableView.getCell(identifier: "ResturentDetailsTableViewCell") as! ResturentDetailsTableViewCell
//            cell.selectionStyle = .none
//            return cell
//        }
//    default:
//        return UITableViewCell()
//    }
