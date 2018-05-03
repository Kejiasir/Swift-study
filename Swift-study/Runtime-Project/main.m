//
//  main.m
//  Runtime-Project
//
//  Created by Yi Qing on 2018/5/2.
//  Copyright © 2018年 Arvin. All rights reserved.
//
// https://blog.csdn.net/vbirdbest/article/details/51980161
// http://www.jianshu.com/p/1e06bfee99d0
// http://www.cocoachina.com/ios/20150824/13104.html
// http://www.jianshu.com/p/46dd81402f63
// http://www.jianshu.com/p/e071206103a4

// https://github.com/Wasappli/WAAppRouting
// https://github.com/usebutton/DeepLinkKit

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// 使用终端命令行切换到mian.m文件所在的目录下并执行：clang -rewrite-objc main.m
// 在mian.m文件目录所在的位置会有一个 main.cpp文件，打开文件可以看到OC代码都被转换成运行时runtime代码了

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        // [[NSObject alloc] init];
        // ((NSObject *(*)(id, SEL))(void *)objc_msgSend)((id)((NSObject *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("NSObject"), sel_registerName("alloc")), sel_registerName("init"));
        
    }
    //    return 0;
}

/*
 
 runtime.h和message.h中的方法一般以objc_、 class_、 method_、 property_、 ivar_、 protocol_、object_、  sel_等作为前缀，用前缀表明操作的对象
 
 常用功能：
 
 1.动态交换两个方法的实现
 2.动态添加对象的成员变量和成员方法
 3.获取某个类的所有成员变量和成员方法
 4.实现NSCoding的自动归档和自动解档
 5.实现字典和模型的自动转换
 6.为类别添加属性(我们知道类别是不能扩展属性的，只能扩展方法，但可以运行时可以实现，通过为类增加属性)
 
 runtime 常用API：
 
 // 创建类对
 Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
 
 // 添加方法
 BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
 
 // 添加属性
 BOOL class_addIvar(Class cls, const char *name, size_t size, uint8_t alignment, const char *types)
 
 // 注册类对
 void  objc_registerClassPair(Class cls)
 
 // 向某个对象发送某个消息
 id objc_msgSend(id self, SEL op, ...)
 
 // 获取某个类的类方法
 Method class_getClassMethod(Class cls, SEL name)
 
 // 获取某个类的实例方法
 Method class_getInstanceMethod(Class cls, SEL name)
 
 // 为类添加一个属性
 void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
 
 // 获取属性对应的值
 id objc_getAssociatedObject(id object, const void *key)
 
 // 获取实例变量列表
 Ivar *class_copyIvarList(Class cls, unsigned int *outCount)
 
 // 获取方法的类型(方法的签名,返回值类型，参数类型)
 const char *method_getTypeEncoding(Method m)
 
 */
