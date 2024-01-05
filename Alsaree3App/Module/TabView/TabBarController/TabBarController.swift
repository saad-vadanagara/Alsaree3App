//
//  TabBarController.swift
//  Alsaree3App
//
//  Created by Neosoft on 15/12/23.
//

import UIKit

class TabBarController: UITabBarController,UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupBorder()
        self.delegate = self
    }
    func setupBorder() {
        tabBar.addTopBorderWithColor(color: ColorConstant.borderColorGray, width: 1.0)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            guard let fromView = selectedViewController?.view, let toView = viewController.view else {
                return false // Make sure you want this as false
            }
            if fromView != toView {
                UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
            }
            return true
        }
    
    func setupTabBar(){
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
            items[0].selectedImage = UIImage(named: TabBar.Home.imageName)?.withRenderingMode(.alwaysTemplate)
            items[0].image = UIImage(named: TabBar.Home.imageName)?.withRenderingMode(.alwaysTemplate)
            items[0].title = TabBar.Home.rawValue
            
            items[1].selectedImage = UIImage(named: TabBar.Search.imageName)?.withRenderingMode(.alwaysTemplate)
            items[1].image = UIImage(named: TabBar.Search.imageName)?.withRenderingMode(.alwaysTemplate)
            items[1].title = TabBar.Search.rawValue
            
            items[2].selectedImage = UIImage(named: TabBar.Profile.imageName)?.withRenderingMode(.alwaysTemplate)
            items[2].image = UIImage(named: TabBar.Profile.imageName)?.withRenderingMode(.alwaysTemplate)
            items[2].title = TabBar.Profile.rawValue
            
            items[3].selectedImage = UIImage(named: TabBar.Basket.imageName)?.withRenderingMode(.alwaysTemplate)
            items[3].image = UIImage(named: TabBar.Basket.imageName)?.withRenderingMode(.alwaysTemplate)
            items[3].title = TabBar.Basket.rawValue
        }
    }
}

