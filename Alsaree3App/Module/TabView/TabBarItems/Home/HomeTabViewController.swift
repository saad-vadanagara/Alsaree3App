//
//  HomeTabViewController.swift
//  Alsaree3App
//
//  Created by Neosoft on 15/12/23.
//

import UIKit

class HomeTabViewController: UIViewController {
    
    @IBOutlet weak var scooterimg: UIImageView!
    @IBOutlet weak var applicationNamelbl: UILabel!
    @IBOutlet weak var areaNavitionBtn: UIButton!
    @IBOutlet weak var hometabTableView: UITableView!
    @IBOutlet weak var headerNavigationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        settingDelegate()
        registerTableViewCell()
        setBackgroundForHeader()
    }
    
    func settingDelegate(){
        hometabTableView.delegate = self
        hometabTableView.dataSource = self
    }
    
    func registerTableViewCell(){
        hometabTableView.registerNib(of: ActiveOrderHomeTabCell.self)
        hometabTableView.registerNib(of: BannerHomeTabCell.self)
        hometabTableView.registerNib(of: CategoryHomeTabCell.self)
    }
    
    func setBackgroundForHeader(){
        headerNavigationView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func setupUI(){
        view.setLabelText(lblrefrence: applicationNamelbl, lbltext: "Alsaree3 App", fontSize: 16,alignmentleft: true)
        
        let imageSize = CGSize(width: 20, height: 20)
        view.setButtonTextWithImage(button: areaNavitionBtn, image: "downArrow", text: "Al Furjan Area", fontSize: 12, imageSize: imageSize)
        
        view.setImage(imageView: scooterimg, imageName: "scooter")
        view.setCircleWithBorderColor(imageView: scooterimg, borderColor: ColorConstant.borderColorYellow, borderWidth: 1)
        
        hometabTableView.separatorStyle = .none
        hometabTableView.backgroundColor = ColorConstant.primaryWhiteBgcolor
        
    }
    
   
}


extension HomeTabViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HomeCellsList.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch HomeCellsList(rawValue: indexPath.row){
        case .orderStatus:
            let cell = tableView.getCell(identifier: "ActiveOrderHomeTabCell") as! ActiveOrderHomeTabCell
            cell.selectionStyle = .none
            return cell
        case .bannerAdv:
            let cell = tableView.getCell(identifier: "BannerHomeTabCell") as! BannerHomeTabCell
            cell.selectionStyle = .none
            return cell
        case .categoryCollection:
            let cell = tableView.getCell(identifier: "CategoryHomeTabCell") as! CategoryHomeTabCell
            cell.selectionStyle = .none
            return cell
        default :
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenSize = UIScreen.main.bounds.height
        switch HomeCellsList(rawValue: indexPath.row)
        {
        case .orderStatus:
            return screenSize*0.10
        case .categoryCollection:
            return screenSize*0.146
        default:
            return UITableView.automaticDimension
        }
    }
}
