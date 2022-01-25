//
//  main.m
//  oc_020518
//
//  Created by Apple on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

/*
    01, Category
        可以给某一个类扩充一些方法(不修改原来类的代码)
 
    02, 分类的注意点
        不能添加成员变量, 只能添加方法
        分类可以访问原来类中声明的成员变量
        分类可以重新实现原来类中的方法, 但是会覆盖掉原来的方法 (不建议 - warning)
        方法调用优先级 : 分类(最后编译的分类优先) - 原来类 - 父类
        
        查看编译的顺序: 左侧面板 项目名 -> TARGETS -> Build Phases -> Compile Sources
        
 */


#import <Foundation/Foundation.h>

#import "../../../../../../PrefixHeader.pch"

#import "Person.h"
#import "Person+y.h"

int main(int argc, const char * argv[]) {
    
    Person *person = [[Person alloc] init];
    
    [person method];
    
    person.age = 21;
    
    [person study];
    
    return 0;
}


