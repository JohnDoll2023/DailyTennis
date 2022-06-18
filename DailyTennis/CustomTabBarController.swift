//
//  CustomTabBarController.swift
//  DailyTennis
//
//  Created by John Doll on 6/17/22.
//

import Foundation
import UIKit

@objc class CustomTabBarController: UITabBarController {
    override var selectedIndex: Int {
        get {
            return 0
        }
        set {
            set(selectedIndex: self.selectedIndex)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    @objc func set(selectedIndex index : Int) {
        _ = self.tabBarController(self, shouldSelect: self.viewControllers![index])
    }
}

@objc extension CustomTabBarController: UITabBarControllerDelegate  {
    @objc func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false // Make sure you want this as false
        }

        if fromView != toView {

            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: { (true) in

            })

            self.selectedViewController = viewController
        }

        return true
    }
}

extension UIViewController {

    
//    open var tabBarItem: UITabBarItem! // Automatically created lazily with the view controller's title if it's not set explicitly.

    
    open var customTabBarController: CustomTabBarController? { get } // If the view controller has a tab bar controller as its ancestor, return it. Returns nil otherwise.
}
