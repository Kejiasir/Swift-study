//
//  CustomNavigationController.swift
//  New-Project
//
//  Created by Yi Qing on 2018/4/28.
//  Copyright © 2018年 Arvin. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupTab()
    }
    
    func setupNav() -> Void {
        //let navBar = UINavigationBar.appearance()
        
    }
    
    func setupTab() -> Void {
        let tabBarItem = UITabBarItem.appearance()
        tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.brown,
                                           NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)],
                                          for: UIControlState.normal)
        tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.orange,
                                           NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)],
                                          for: UIControlState.selected)
        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        return super.popViewController(animated: animated)
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
