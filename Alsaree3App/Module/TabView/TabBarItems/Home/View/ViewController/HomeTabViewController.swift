
//
//  HomeTabViewController.swift
//  Alsaree3App
//
//  Created by Neosoft on 15/12/23.
//

import UIKit
class HomeTabViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var scooterimg: UIImageView!
    @IBOutlet weak var applicationNamelbl: UILabel!
    @IBOutlet weak var areaNavitionBtn: UIButton!
    @IBOutlet weak var hometabTableView: UITableView!
    @IBOutlet weak var headerNavigationView: UIView!
    
    let viewModel = HomeTabViewModel()
    var headerView : HomeTabCategoryHeader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        settingDelegate()
        registerTableViewCell()
        setupHeaderView()
    }
    
    func settingDelegate(){
        hometabTableView.delegate = self
        hometabTableView.dataSource = self
    }
    
    func registerTableViewCell(){
        // MARK: TableViewCell
        hometabTableView.registerNib(of: ActiveOrderHomeTabCell.self)
        hometabTableView.registerNib(of: BannerHomeTabCell.self)
        hometabTableView.registerNib(of: CategoryHomeTabCell.self)
        hometabTableView.registerNib(of: AdvertisementCell.self)
        hometabTableView.registerNib(of: FoodCatrgoryCell.self)
        hometabTableView.registerNib(of: GoldCategoryCardCellTableViewCell.self)
        hometabTableView.registerNib(of: ResturentTableViewCell.self)
        hometabTableView.registerNib(of: ResturentDetailsTableViewCell.self)
    }
    
    func setupHeaderView(){
        
        headerNavigationView.backgroundColor = ColorConstant.whitecolor
        headerNavigationView.addBottomBorderWithColor(color: ColorConstant.borderColorGray, width: 1)
        view.applyShadow(to: headerNavigationView)
        
    }
    
    func setupUI(){
        
        view.setLabelText(lblrefrence: applicationNamelbl, lbltext: TextConstant.alsaree3App.rawValue, fontSize: 16,alignmentLeft: true)
        
        let imageSize = CGSize(width: 20, height: 20)
        view.setButtonTextWithImage(button: areaNavitionBtn, image: ImageConstant.downArrow.rawValue, text: ButtonTextConstant.alFurjanArea.rawValue, fontSize: 12, imageSize: imageSize)
        view.setImage(imageView: scooterimg, imageName: ImageConstant.scooter.rawValue)
        view.setCircleWithBorderColor(imageView: scooterimg, borderColor: ColorConstant.borderColorYellow, borderWidth: 1)
        
        // removing the seprator line
        hometabTableView.separatorStyle = .none
        hometabTableView.backgroundColor = ColorConstant.primaryWhiteBgcolor
        hometabTableView.sectionHeaderHeight = 0
        hometabTableView.sectionFooterHeight = 0
        hometabTableView.sectionHeaderTopPadding = 0
        
        hometabTableView.showsVerticalScrollIndicator = false
    }
    
}


extension HomeTabViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.HomeTabData.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sectionData = viewModel.HomeTabData[section] as? [any CaseIterable] {
            return sectionData.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the section data for the current section
        let sectionData = viewModel.HomeTabData[indexPath.section]
        
        // Handle cells based on section type
        switch sectionData {
        case let aboveHeaderSection as [SectionAboveHeader]:
            let cellType = aboveHeaderSection[indexPath.row]
            switch cellType {
            case .orderStatus:
                if true {
                let cell = tableView.getCell(identifier: CellConstant.activeOrderHomeTabCell.rawValue) as! ActiveOrderHomeTabCell
                cell.selectionStyle = .none
                return cell
            } else {
                let cell = tableView.getCell(identifier: "GoldCategoryCardCellTableViewCell") as! GoldCategoryCardCellTableViewCell
                cell.selectionStyle = .none
                return cell
            }
            case .bannerAdv:
                let cell = tableView.getCell(identifier: CellConstant.bannerHomeTabCell.rawValue) as! BannerHomeTabCell
                cell.selectionStyle = .none
                return cell
            }
        case let belowHeaderSection as [SectionBelowScrollingHeader]:
            let cellType = belowHeaderSection[indexPath.row]
            switch cellType {
            case .dealsCollection:
                let cell = tableView.getCell(identifier: CellConstant.advertisementCell.rawValue) as! AdvertisementCell
                cell.selectionStyle = .none
                return cell
            case .foodCategoryList:
                let cell = tableView.getCell(identifier: CellConstant.foodCatrgoryCell.rawValue) as! FoodCatrgoryCell
                cell.selectionStyle = .none
                return cell
                
            case .orderAgain:
                let cell = tableView.getCell(identifier: "ResturentTableViewCell") as! ResturentTableViewCell
                cell.featuredData = viewModel.resturentCollectionViewData[0]
                cell.selectionStyle = .none
                return cell
            case .featured:
                let cell = tableView.getCell(identifier: "ResturentTableViewCell") as! ResturentTableViewCell
                cell.featuredData = viewModel.resturentCollectionViewData[1]
                cell.selectionStyle = .none
                return cell
            case .offersNearby:
                let cell = tableView.getCell(identifier: "ResturentTableViewCell") as! ResturentTableViewCell
                cell.featuredData = viewModel.resturentCollectionViewData[1]
                cell.selectionStyle = .none
                return cell
            case .otherCells:
                let cell = tableView.getCell(identifier: "ResturentDetailsTableViewCell") as! ResturentDetailsTableViewCell
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
}
extension HomeTabViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section{
        case 1:
            headerView = Bundle.main.loadNibNamed("HomeTabCategoryHeader", owner: self, options: nil)?.first as? HomeTabCategoryHeader
            return headerView
        case 2:
            let cell = Bundle.main.loadNibNamed("TabBarTableViewHeader", owner: self, options: nil)?.first as! TabBarTableViewHeader
            view.setLabelText(lblrefrence: cell.headerTitle, lbltext: "Featured", fontSize: 20,isBold: true)
            view.setButtonText(button: cell.headerButton, label: "See More",color: ColorConstant.primaryYellowColor, size: 14,isUnderline:true)
            return cell
        case 3:
            let cell = Bundle.main.loadNibNamed("TabBarTableViewHeader", owner: self, options: nil)?.first as! TabBarTableViewHeader
            view.setLabelText(lblrefrence: cell.headerTitle, lbltext: "Offers Nearby", fontSize: 20,isBold: true)
            view.setButtonText(button: cell.headerButton, label: "See More",color: ColorConstant.primaryYellowColor, size: 14,isUnderline:true)
            return cell
        case 4:
            let cell = Bundle.main.loadNibNamed("TabBarTableViewHeader", owner: self, options: nil)?.first as! TabBarTableViewHeader
            view.setLabelText(lblrefrence: cell.headerTitle, lbltext: "Most Popular Place", fontSize: 20,isBold: true)
            view.setButtonText(button: cell.headerButton, label: "See More",color: ColorConstant.primaryYellowColor, size: 14,isUnderline:true)
            return cell
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        hometabTableView.bounds.height*0.7
    }
    
}

extension HomeTabViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerRect = hometabTableView.rect(forSection: 1)
        
        if headerRect.origin.y <= scrollView.contentOffset.y && scrollView.contentOffset.y <= headerRect.origin.y + headerRect.size.height {
            headerView?.hideImages()
            headerView?.setCustomConstrain()
            headerView?.categroyBackView.backgroundColor = UIColor.lightGray
        } else {
            headerView?.backgroundColor = UIColor.clear
            headerView?.showImages()// Reset to original height here
            headerView?.setDefaultConstrain()
            headerView?.categroyBackView.backgroundColor = UIColor.clear
        }
        
    }
}
