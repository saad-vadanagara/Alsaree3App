//
//  BasketTabViewController.swift
//  Alsaree3App
//
//  Created by Neosoft on 19/12/23.
//

import UIKit

class BasketTabViewController: UIViewController {

    @IBOutlet weak var BasketTabTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BasketTabTableView.separatorStyle = .none
        setupdeligate()
        registerCell()
    }
    
    func setupdeligate(){
        BasketTabTableView.delegate = self
        BasketTabTableView.dataSource = self
    }
    
    func registerCell(){
        BasketTabTableView.registerNib(of: ErrorStateTableViewCell.self)
    }
   
}

extension BasketTabViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ErrorStateTableViewCell", for: indexPath) as! ErrorStateTableViewCell
        cell.isApiError = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableviewScreen = tableView.bounds.height
        return tableviewScreen
    }
    

}
