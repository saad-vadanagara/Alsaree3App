//
//  TabBarController.swift
//  Alsaree3App
//
//  Created by Neosoft on 15/12/23.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: ColorConstant.blackcolor,
            .font: UIFont(name: FontConstant.regular.rawValue, size: 10) ?? UIFont.systemFont(ofSize: 10)
        ]
        
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: ColorConstant.primaryYellowColor,
            .font: UIFont(name: FontConstant.bold.rawValue, size: 10) ?? UIFont.systemFont(ofSize: 10)
        ]
        
        // Set the unselected text color and image color
        UITabBarItem.appearance().setTitleTextAttributes(normalTextAttributes, for: .normal)
        UITabBar.appearance().unselectedItemTintColor = ColorConstant.blackcolor
        
        // Set the selected text color and image color
        UITabBarItem.appearance().setTitleTextAttributes(selectedTextAttributes, for: .selected)
        UITabBar.appearance().tintColor = ColorConstant.primaryYellowColor
        
        // Customize individual tab bar items (replace with your own images and titles)
        if let items = tabBar.items {
            items[0].selectedImage = UIImage(named: "Home")?.withRenderingMode(.alwaysTemplate)
            items[0].image = UIImage(named: "Home")?.withRenderingMode(.alwaysTemplate)
            items[0].title = "Home"
            
            items[1].selectedImage = UIImage(named: "Search")?.withRenderingMode(.alwaysTemplate)
            items[1].image = UIImage(named: "Search")?.withRenderingMode(.alwaysTemplate)
            items[1].title = "Search"
            
            items[2].selectedImage = UIImage(named: "user")?.withRenderingMode(.alwaysTemplate)
            items[2].image = UIImage(named: "user")?.withRenderingMode(.alwaysTemplate)
            items[2].title = "Profile"
            
            items[3].selectedImage = UIImage(named: "bag")?.withRenderingMode(.alwaysTemplate)
            items[3].image = UIImage(named: "bag")?.withRenderingMode(.alwaysTemplate)
            items[3].title = "Basket"
            
        }
    }
}

