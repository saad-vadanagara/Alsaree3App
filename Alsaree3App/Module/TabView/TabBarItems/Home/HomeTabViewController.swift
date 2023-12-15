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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        settingDelegate()
        registerTableViewCell()
        
    }
    
    func settingDelegate(){
//        hometabTableView.delegate = self
//        hometabTableView.dataSource = self
    }
    
    func registerTableViewCell(){
        
    }
    
    func setupUI(){
        view.setLabelText(lblrefrence: applicationNamelbl, lbltext: "Alsaree3 App", fontSize: 16,alignmentleft: true)
        
        let imageSize = CGSize(width: 20, height: 20)
        view.setButtonTextWithImage(button: areaNavitionBtn, image: "downArrow", text: "Al Furjan Area", fontSize: 12, imageSize: imageSize)
        
        view.setImage(imageView: scooterimg, imageName: "scooter")
        view.setCircleWithBorderColor(imageView: scooterimg, borderColor: ColorConstant.borderColorYellow, borderWidth: 1)
        
    }
    
   
}

//extension HomeTabViewController : UITableViewDelegate{
//
//}
//
//extension HomeTabViewController : UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}
