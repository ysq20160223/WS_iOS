//
//  main.m
//  oc_020503
//
//  Created by Apple on 2017/7/11.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
    01, 成员变量
    @public : 任何地方都可以访问
    @private : 只能在当前类的对象方法中直接访问 // 子类拥有此成员变量, 不能直接访问
    @protected :  能在当前类和子类对象中直接访问 (默认)
 
    @package : 没有显示定义 
 
    02, .m 文件定义的成员变量为私有; 若是直接写在 main 函数文件的前面, 可以定义 @public
        不能定义和 @interface 中一样的成员变量
 
    
 
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    
    
    return 0;
}
