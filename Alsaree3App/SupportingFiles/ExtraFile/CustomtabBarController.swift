import UIKit

class CustomTabBar: UITabBar {
    
//    var screenHeigth = UIScreen.main.bounds.height
//    private var smallScreenTabHeight: CGFloat = UIScreen.main.bounds.height * 0.08
//    private var largeScreenTabHeight: CGFloat = UIScreen.main.bounds.height * 0.15
//    override func sizeThatFits(_ size: CGSize) -> CGSize {
//        if screenHeigth <= 675{
//            var newSize = super.sizeThatFits(size)
//            newSize.height = smallScreenTabHeight
//            return newSize
//        }else{
//            var newSize = super.sizeThatFits(size)
//            newSize.height = largeScreenTabHeight
//            return newSize
//        }
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if let tabBarItems = items, !tabBarItems.isEmpty {
            for (index, item) in tabBarItems.enumerated() {
                item.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0)
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)            }
        }
    }

}

