//
//  CustomTabBarController.swift
//  New-Project
//
//  Created by Yi Qing on 2018/4/28.
//  Copyright © 2018年 Arvin. All rights reserved.
//

import UIKit
import SwipeableTabBarController

class CustomTabBarController: SwipeableTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加自控制器
        addChildViewController(Test1ViewController(), title: "首页", image: "image")
        addChildViewController(Test2ViewController(), title: "商城", image: "image")
        addChildViewController(Test3ViewController(), title: "发现", image: "image")
        addChildViewController(Test4ViewController(), title: "我的", image: "image")
        
        // 配置滑动式 tabbar
        setSwipeAnimation(type: SwipeAnimationType.overlap)
        setTapAnimation(type: SwipeAnimationType.overlap)
        setDiagonalSwipe(enabled: true)
        isSwipeEnabled = false
    }
    
    func addChildViewController(_ childController: UIViewController, title: String, image: String) -> Void {
        let navControl = CustomNavigationController(rootViewController: childController)
        let norImage = UIImage(named: "tabbar_\(image)_normal")?.withRenderingMode(.alwaysOriginal)
        let selImage = UIImage(named: "tabbar_\(image)_select")?.withRenderingMode(.alwaysOriginal)
        navControl.tabBarItem = UITabBarItem(title: title, image: norImage, selectedImage: selImage)
        childController.navigationItem.title = title
        self.addChildViewController(navControl)
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
