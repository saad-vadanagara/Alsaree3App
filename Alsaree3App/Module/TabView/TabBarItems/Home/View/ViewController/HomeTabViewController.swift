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
        
        hometabTableView.rowHeight = UITableView.automaticDimension
        hometabTableView.estimatedRowHeight = hometabTableView.bounds.height*0.45
        hometabTableView.sectionHeaderTopPadding = 0
        hometabTableView.sectionFooterHeight = 0
        
        hometabTableView.showsVerticalScrollIndicator = false
    }
    
}


extension HomeTabViewController:UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HomeCellsList.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch HomeCellsList(rawValue: indexPath.row){
        case .orderStatus:
            if false{
                let cell = tableView.getCell(identifier: CellConstant.activeOrderHomeTabCell.rawValue) as! ActiveOrderHomeTabCell
                cell.selectionStyle = .none
                return cell
            }else{
                let cell = tableView.getCell(identifier: "GoldCategoryCardCellTableViewCell") as! GoldCategoryCardCellTableViewCell
                cell.selectionStyle = .none
                return cell
            }
        case .bannerAdv:
            let cell = tableView.getCell(identifier: CellConstant.bannerHomeTabCell.rawValue) as! BannerHomeTabCell
            cell.selectionStyle = .none
            return cell
        case .categoryCollection:
            let cell = tableView.getCell(identifier: CellConstant.categoryHomeTabCell.rawValue) as! CategoryHomeTabCell
            cell.selectionStyle = .none
            return cell
        case .dealsCollection:
            let cell = tableView.getCell(identifier: CellConstant.advertisementCell.rawValue) as! AdvertisementCell
            cell.selectionStyle = .none
            return cell
        case .foodCategoryList:
            let cell = tableView.getCell(identifier: CellConstant.foodCatrgoryCell.rawValue) as! FoodCatrgoryCell
            cell.selectionStyle = .none
            return cell
        case .orderAgain :
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
            cell.featuredData = viewModel.resturentCollectionViewData[2]
            
            cell.selectionStyle = .none
            return cell
        case .otherCells:
            let cell = tableView.getCell(identifier: "ResturentDetailsTableViewCell") as! ResturentDetailsTableViewCell
            return cell
        default :
            return UITableViewCell()
        }
        
    }
    
}


extension HomeTabViewController : UITableViewDelegate{

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        // Getting the height of hole Screen
//        let screenSize = UIScreen.main.bounds.height
//
//        switch HomeCellsList(rawValue: indexPath.row)
//        {
//        case .orderStatus:
//            return screenSize*0.10
//        case .categoryCollection:
//            return screenSize*0.146
//        case .dealsCollection:
//            return screenSize*0.23
//        case .foodCategoryList:
//            return screenSize*0.16
//        case .orderAgain:
//            return screenSize*0.47
//        case .offersNearby:
//            return screenSize*0.47
//        case .featured:
//            return screenSize*0.47
//        case .otherCells:
//            return screenSize*0.37
//
//        default:
//            return UITableView.automaticDimension
//        }
//    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("TabBarTableViewHeader", owner: self, options: nil)?.first as! TabBarTableViewHeader
        
        view.setLabelText(lblrefrence: headerView.headerTitle, lbltext: "Featured", fontSize: 20)
        view.setButtonText(button: headerView.headerButton, label: "See More", size: 14)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        hometabTableView.bounds.height*0.7
    }
    
}    


extension HomeTabViewController : UIScrollViewDelegate{
    
}
