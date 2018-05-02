//
//  BasicViewController.swift
//  New-Project
//
//  Created by Yi Qing on 2018/4/28.
//  Copyright © 2018年 Arvin. All rights reserved.
//

import UIKit
import SnapKit

class BasicViewController: UIViewController {
    
    // 利用便利构造函数设置参数初始化控制器
    convenience init(title: String? = "") {
        self.init()
        self.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("按钮", for: .normal)
        button.backgroundColor = .magenta
        self.view.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 44))
            make.center.equalTo(self.view)
        }
    }
    
    @objc func btnClick(_ sender: UIButton) -> Void {}
    
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
