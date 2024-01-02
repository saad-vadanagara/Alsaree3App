
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
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var downArrowImage: UIImageView!
    @IBOutlet weak var hometabTableView: UITableView!
    @IBOutlet weak var headerNavigationView: UIView!
    @IBOutlet weak var circularProgresView: UIView!
    @IBOutlet weak var progressLbl: UILabel!
    
    var circularProgressView: CircularProgressView!
    let viewModel = HomeTabViewModel()
    var headerView : HomeTabCategoryHeader?
    
    // For Tabbar visible/ hide
    private var previousScrollOffset: CGFloat = 0
    private var tabBarVisible = true
    
    override func viewWillAppear(_ animated: Bool) {
        hometabTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingDelegate()
        setupTableview()
        registerTableViewCell()
        setupUI()
        setupHeaderView()
        hideProgressView()
        setUpCircularprogress(currentProgress: 0.2)
    }
    
    func setupTableview(){
        hometabTableView.separatorStyle = .none
        hometabTableView.backgroundColor = ColorConstant.primaryWhiteBgcolor
        hometabTableView.sectionHeaderHeight = 0
        hometabTableView.sectionFooterHeight = 0
        if #available(iOS 15.0, *) {
            hometabTableView.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
        hometabTableView.showsVerticalScrollIndicator = false
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
        
        // Setting the label and button values Manually
        view.setLabelText(lblrefrence: applicationNamelbl, lbltext: TextConstant.alsaree3App.rawValue, fontSize: 16,alignmentLeft: true)
        let imageSize = CGSize(width: 20, height: 20)
        view.setLabelText(lblrefrence: locationLbl, lbltext: "Al Furjan Area", fontSize: 12,lineHeightMultiple: 0.8)
        view.setImage(imageView: downArrowImage, imageName: "downArrow")
        view.setImage(imageView: scooterimg, imageName: ImageConstant.scooter.rawValue)
        view.setCircleWithBorderColor(imageView: scooterimg, borderColor: ColorConstant.borderColorYellow, borderWidth: 1)
    }
    
    func setUpCircularprogress(currentProgress: Float){
        circularProgresView.layer.cornerRadius = (circularProgresView.bounds.width + 4)/2
        circularProgresView.backgroundColor = UIColor.clear
        
        // Adding the Frame
        circularProgressView = CircularProgressView(frame: circularProgresView.bounds, lineWidth: 2, rounded: true)
        circularProgressView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //Adding color to Progress view
        circularProgressView.progressColor = ColorConstant.primaryYellowColor
        circularProgressView.trackColor = ColorConstant.borderColorGray
        
        circularProgresView.addSubview(circularProgressView)
        
        // for demo Added some Value
        circularProgressView.setProgress(to: currentProgress)
        let percentage = Int(currentProgress * 100)
        view.setLabelText(lblrefrence: progressLbl, lbltext: "\(percentage)%", fontSize: 12)
        
    }
    
    func setupUI(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func hideProgressView(){
        circularProgresView.isHidden = true
        progressLbl.isHidden = true
        
    }
    
    func showProgressView(){
        circularProgresView.isHidden = false
        progressLbl.isHidden = false
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
        case let aboveSection as [SectionAboveHeader]:
            let cellType = aboveSection[indexPath.row]
            switch cellType {
            case .orderStatus:
                if true{
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
                cell.hometabDelegate = self
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
            case (0, 0):
                return viewModel.activeOrder ? UITableView.automaticDimension : 0
            case (1, _):
                // For section 1, set the height based on your logic for other cells in that section
                return UITableView.automaticDimension
            default:
                // For other sections and rows, use automatic dimension
                return UITableView.automaticDimension
            }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section{
        case 1:
            headerView = Bundle.main.loadNibNamed("HomeTabCategoryHeader", owner: self, options: nil)?.first as? HomeTabCategoryHeader
            return headerView
            
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
        
        //MARK:  for sticky header
        let headerRect = hometabTableView.rect(forSection: 1)
        if headerRect.origin.y <= scrollView.contentOffset.y && scrollView.contentOffset.y <= headerRect.origin.y + headerRect.size.height {
            headerView?.hideImages()
            headerView?.setCustomConstrain()
            showProgressView()
            headerView?.categroyBackView.backgroundColor = ColorConstant.borderColorGray
        } else {
            headerView?.backgroundColor = UIColor.clear
            headerView?.showImages()// Reset to original height here
            headerView?.setDefaultConstrain()
            hideProgressView()
            headerView?.categroyBackView.backgroundColor = UIColor.clear
        }
        
        //MARK: For tab bar hide/show
        let currentScrollOffset = scrollView.contentOffset.y
        let scrollDirection: ScrollDirection
        if currentScrollOffset > previousScrollOffset {
            scrollDirection = .down
        } else if currentScrollOffset < previousScrollOffset {
            scrollDirection = .up
        } else {
            scrollDirection = .none
        }
        
        let threshold: CGFloat = 100
        if currentScrollOffset > threshold {
            updateTabBarVisibility(for: scrollDirection)
        }
        
        previousScrollOffset = currentScrollOffset
        
        
    }
    
    private func updateTabBarVisibility(for scrollDirection: ScrollDirection) {
        let isScrollingDown = scrollDirection == .down
        let isScrollingUp = scrollDirection == .up
        
        let animationDuration: TimeInterval = 0.3
        
        UIView.animate(withDuration: animationDuration, animations: {
            // Adjust the Y-coordinate based on the scroll direction
            self.tabBarController?.tabBar.frame.origin.y = isScrollingDown ?
            (self.view.frame.origin.y + self.view.frame.size.height) :
            (self.view.frame.origin.y + self.view.frame.size.height - self.tabBarController!.tabBar.frame.size.height)
        }) { (_) in
            // Optionally, you can add completion code here if needed
        }
        
    }
    
}

extension HomeTabViewController:NavigateFormHomeTab{
    func seeMoreBtnNavigation() {
        let newViewController = storyboard?.instantiateViewController(withIdentifier: "RestaurantDetailsVC") as! RestaurantDetailsVC
        // extra function
        viewModel.activeOrder = true
        newViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(newViewController, animated: true)
    }
}


