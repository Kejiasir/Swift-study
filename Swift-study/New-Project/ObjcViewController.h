//
//  ObjcViewController.h
//  New-Project
//
//  Created by Yi Qing on 2018/5/3.
//  Copyright © 2018年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 相关官方文档描述
 https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/Migration.html#//apple_ref/doc/uid/TP40014216-CH12-ID108
 The Migration Process
 The most effective approach for migrating code to Swift is on a per-file basis—that is, one class at a time.
 Because you can’t subclass Swift classes in Objective-C, it’s best to choose a class in your app that doesn’t have any subclasses.
 You’ll replace the .m and .h files for that class with a single .swift file. Everything from your implementation and interface goes directly into this single Swift file.
 You won’t create a header file; Xcode generates a header automatically in case you need to reference it.
 */
// swift 混编 oc，oc 类不能继承 swift 类
// Cannot subclass a class that was declared with the 'objc_subclassing_restricted' attribute
// 无法对使用'objc_subclassing_restricted'属性声明的类进行子类化
//@interface ObjcViewController : BasicViewController

@interface ObjcViewController : UIViewController

@end
