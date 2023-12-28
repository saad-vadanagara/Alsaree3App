//
//  TabBarController.swift
//  Alsaree3App
//
//  Created by Neosoft on 15/12/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    var indicatorView: UIView!
    let higherTabBarInset: CGFloat = 10
    let indicatorHeight: CGFloat = 2
    let indicatorWidthRatio: CGFloat = 0.8
    let animationDuration: TimeInterval = 0.3
    let shakeAnimation: CABasicAnimation = {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 1
        shake.autoreverses = true
        return shake
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupBorder()
        setupIndicatorView()
    }
    
    func setupIndicatorView() {
        guard let itemCount = tabBar.items?.count, itemCount > 0 else {
            return
        }
        
        let tabWidth = tabBar.frame.width / CGFloat(itemCount)
        let initialWidth = tabWidth * indicatorWidthRatio
        let initialX = (tabWidth - initialWidth) / 2
        
        indicatorView = UIView(frame: CGRect(x: initialX, y: 0, width: initialWidth, height: indicatorHeight))
        indicatorView.backgroundColor = ColorConstant.primaryYellowColor
        tabBar.addSubview(indicatorView)
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.firstIndex(of: item),
              let count = tabBar.items?.count else { return }
        
        let tabWidth = tabBar.frame.width / CGFloat(count)
        let newWidth = tabWidth * indicatorWidthRatio
        let xOffset = (tabWidth - newWidth) / 2
        
        UIView.animate(withDuration: animationDuration, animations: {
            self.indicatorView.frame = CGRect(x: tabWidth * CGFloat(index) + xOffset, y: 0, width: newWidth, height: self.indicatorHeight)
        }, completion: { _ in
            self.addShakeEffect(to: self.indicatorView)
        })
    }
    
    func addShakeEffect(to view: UIView) {
        shakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 1, y: view.center.y))
        shakeAnimation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 1, y: view.center.y))
        view.layer.add(shakeAnimation, forKey: "position")
    }
    
    
    func setupBorder() {
        tabBar.addTopBorderWithColor(color: ColorConstant.borderColorGray, width: 1.0)
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

