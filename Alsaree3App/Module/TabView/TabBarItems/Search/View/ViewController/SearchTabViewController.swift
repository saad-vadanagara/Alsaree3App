//
//  SearchTabViewController.swift
//  Alsaree3App
//
//  Created by Neosoft on 16/12/23.
//

import UIKit
//import ShimmerSwift

class SearchTabViewController: UIViewController{
    
    
    @IBOutlet weak var scooterimg: UIImageView!
    @IBOutlet weak var applicationNamelbl: UILabel!
    
    @IBOutlet weak var areaNavitionBtn: UIButton!
    @IBOutlet weak var areaNavigationView: UIView!
    @IBOutlet weak var searchtabTableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingDelegate()
        registerTableViewCell()
        searchtabTableView.separatorStyle = .none
        searchtabTableView.backgroundColor = ColorConstant.primaryWhiteBgcolor
//        setupShimmer()
        LoaderManager.showLoader(in: view)
        
        
    }
    
//    func setupShimmer() {
//        if false {
//            // Handle shimmering when API call is done
//        } else {
//            scooterimg.layer.cornerRadius = 0
//            scooterimg.layer.borderWidth = 0
//         
//            let applicationNamelblShimmer = ShimmeringView(frame: applicationNamelbl.bounds)
//            applicationNamelbl.addSubview(applicationNamelblShimmer)
//            
//            let areaNavigationViewShimmer = ShimmeringView(frame: areaNavigationView.bounds)
//            areaNavigationView.addSubview(areaNavigationViewShimmer)
//            
//            
//            let applicationNamelblBackgroundView = UIView(frame: applicationNamelbl.bounds)
//            applicationNamelblBackgroundView.layer.cornerRadius = 5
//            applicationNamelblBackgroundView.backgroundColor = ColorConstant.borderColorGray
//            
//            
//            let areaNavigationViewContentView = UIView(frame: areaNavigationViewShimmer.bounds)
//            areaNavigationViewContentView.layer.cornerRadius = 5
//            areaNavigationViewContentView.backgroundColor = ColorConstant.borderColorGray
//            
//            
//            let scooterimgContainer = UIView(frame: scooterimg.bounds)
//            scooterimg.addSubview(scooterimgContainer)
//        
//            
//            let scooterimgShimmer = ShimmeringView(frame: scooterimgContainer.bounds)
//            scooterimgContainer.addSubview(scooterimgShimmer)
//            
//            let scooterimgContentView = UIView(frame: scooterimgShimmer.bounds)
//            scooterimgContentView.layer.cornerRadius = 5
//            scooterimgContentView.backgroundColor = ColorConstant.borderColorGray
//            
//            
//            areaNavigationViewShimmer.contentView = areaNavigationViewContentView
//            applicationNamelblShimmer.contentView = applicationNamelblBackgroundView
//            scooterimgShimmer.contentView = scooterimgContentView
//            
//            scooterimgShimmer.isShimmering = true
//            applicationNamelblShimmer.isShimmering = true
//            areaNavigationViewShimmer.isShimmering = true
//        }
//    }
    
    
    func settingDelegate(){
        searchtabTableView.delegate = self
        searchtabTableView.dataSource = self
    }
    
    func registerTableViewCell(){
        // MARK: TableViewCell
        searchtabTableView.registerNib(of: LoadingTableViewCell.self)
    }
    
}

extension SearchTabViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getCell(identifier: "LoadingTableViewCell") as! LoadingTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableviewSize = tableView.bounds.height
        return tableviewSize
    }
    
}
