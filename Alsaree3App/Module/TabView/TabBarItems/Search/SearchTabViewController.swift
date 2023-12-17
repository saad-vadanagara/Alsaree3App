//
//  SearchTabViewController.swift
//  Alsaree3App
//
//  Created by Neosoft on 16/12/23.
//

import UIKit

class SearchTabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var searchtabTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchtabTableView.delegate = self
        searchtabTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! oneCell
        return cell
    }
    

}
