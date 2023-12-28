//
//  ProfileTabViewController.swift
//  Alsaree3App
//
//  Created by Neosoft on 19/12/23.
//

import UIKit

class ProfileTabViewController: UIViewController {

    @IBOutlet weak var ProfileTabTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfileTabTableView.separatorStyle = .none
        setupdeligate()
        registerCell()
    }
    
    func setupdeligate(){
        ProfileTabTableView.delegate = self
        ProfileTabTableView.dataSource = self
    }
    
    func registerCell(){
        ProfileTabTableView.registerNib(of: ErrorStateTableViewCell.self)
    }
   
}

extension ProfileTabViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getCell(identifier: CellConstant.errorStateTableViewCell.rawValue) as ErrorStateTableViewCell
        cell.isInternetError = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableviewScreen = tableView.bounds.height
        return tableviewScreen
    }
    
    
}
