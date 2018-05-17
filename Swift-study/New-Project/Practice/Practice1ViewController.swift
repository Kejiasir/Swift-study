//
//  Practice1ViewController.swift
//  New-Project
//
//  Created by Yi Qing on 2018/5/4.
//  Copyright © 2018年 Arvin. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: -
/// 类
class MyClass {
    
    class func changeStr(_ oStr: String) -> Void { 
        // 根据 '.' 分割成数组
        let arr = oStr.components(separatedBy: ".")
        // oStr.components(separatedBy: CharacterSet(charactersIn: "."))
        // 翻转数组元素，在元素中间加入'\', 需要多加'\'转义
        let nStr = arr.reversed().joined(separator: "\\")
        print(nStr) // com\baidu\www
    }
}

/// 结构体
struct MyStruct {
    
    var name: String?
    var age: Int = 0
    
    init(rename: String, age: Int) {
        self.name = rename
        self.age = age
    }
    func test() -> () {
        guard let aName = name else { return }
        print(aName, age)
    }
}

// MARK: -
class Practice1ViewController: BasicViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 300, height: 150))
            make.centerX.equalTo(self.view)
            make.top.equalTo(100)
        }
    }
    
    override func btnClick(_ sender: UIButton) {
        test1(type: MyClass.self)
        test2(type: MyStruct.self)
    }
    
    // MARK: -
    func test1(type: MyClass.Type) -> () {
        type.changeStr("www.baidu.com")
    }
    
    // MARK: -
    func test2(type: MyStruct.Type) -> () {
        var `struct` = type.init(rename: "arvin", age: 20)
        `struct`.test()
        `struct`.name = "jhon"
        `struct`.age = 30
        `struct`.test()
    }
    
    // MARK: - 判断字符串是否包含中文
    func isContainChinese(_ string: String) -> Bool {
        for (_, value) in string.enumerated() {
            if ("\u{4E00}" <= value && value <= "\u{9FA5}") {
                return true
            }
        }
        return false
    }
    
    // MARK: - lazy load
    lazy var imageView: UIImageView = {
        let imgView = UIImageView() 
        imgView.kf.setImage(with: URL(string: "http://oonis1a4c.bkt.clouddn.com/20180112-00-blog.png"))
        return imgView
    }()
    
}












