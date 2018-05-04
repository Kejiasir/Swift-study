//
//  Test1ViewController.swift
//  New-Project
//
//  Created by Yi Qing on 2018/4/28.
//  Copyright © 2018年 Arvin. All rights reserved.
//  Swift中Runtime简单了解以及项目中的运用 https://www.jianshu.com/p/a7295f759480

import UIKit

class Test1ViewController: BasicViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "\(datasource[indexPath.row])"
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // ViewControllers 文件夹中的控制器命名是不规范的，只做学习用途
        // 包括项目命名，不要使用中划线'-'，可以使用下划线'_'
        
        // 字符串替换方法一：
        // let oStr = datasource[indexPath.row]    //  取出选中行的字符串
        // let arr = oStr.components(separatedBy: " ") // 根据空格转换成数组
        // let nStr = arr.joined(separator: "_")   // 在数组元素中间加入下划线'_'后，返回一个新的字符串
        
        // 字符串替换方法二：
        // 将字符串中的空格替换成下划线'_'
        let str = datasource[indexPath.row].replacingOccurrences(of: " ", with: "_")
        
        // 取出项目名称（Swift的命名空间）
        if let project = Bundle.main.infoDictionary!["CFBundleExecutable"] {
            // 将项目名称中的'-'替换成'_'
            let projectName = (project as! String).replacingOccurrences(of: "-", with: "_")
            // 根据 "项目名称.选中行的字符串名称" 转换成类名，如果没有的话返回 nil
            // `class`: class 是官方定义的关键字，要使用同名称需要用反向单引号 `` 包括
            let `class`: AnyClass? = NSClassFromString(projectName + "." + str)
            // 将类名转换成控制器类型
            guard let vcName = `class` as? BasicViewController.Type else {
                print("没有找到`class`对应的控制器名进行转换")
                return
            }
            // 使用class类型值构造类类型为"BasicViewController"的对象必须使用"init()"初始值设定项
            let vc = vcName.init()
            vc.title = datasource[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: - lazy load
    lazy var tableView = { () -> UITableView in
        let tab = UITableView(frame: .zero, style: .plain)
        tab.dataSource = self
        tab.delegate = self
        return tab
    }()
    
    lazy var datasource: Array = { () -> [String] in
        let path = Bundle.main.path(forResource: "TitleList", ofType: "plist")
        return NSArray(contentsOfFile: path ?? "") as! [String]
    }()
    
}
