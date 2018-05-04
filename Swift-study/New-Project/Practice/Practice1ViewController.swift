//
//  Practice1ViewController.swift
//  New-Project
//
//  Created by Yi Qing on 2018/5/4.
//  Copyright © 2018年 Arvin. All rights reserved.
//

import UIKit

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

class Practice1ViewController: BasicViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
}
