//
//  oc_020201.m
//
//  Created by Apple on 2017/7/8.
//

/*
 编译 : cc oc_020201.m -framework Foundation
 
 01, 对象的创建 : 声明和实现
 02, 成员变量的直接赋值 (成员变量 = 实例变量)
 03, 方法／行为 : 声明和实现
 
 */

#import <Foundation/Foundation.h>


#define DEBUG
#import "../../../../PrefixHeader.pch"



// 1, 类的声明 (声明必须在调用之前, 实现可以放在末尾)
@interface Car : NSObject {
// {} : 用来声明对象属性, 成员变量默认会初始化为0
    // 可以让外部的指针间接访问对象内部的成员变量
    // 不允许在声明中初始化
@public
    int wheels;
    int speed;
}

// oc 对象的方法, 必须以 - 开头; 任何数据类型都必须用小括号()
// 只能写方法的声明
- (void)run;

@end



// 2, 类的实现 : 用来实现 @interface 中声明的方法
@implementation Car

- (void)run {
    NSLog(@"call run method");
}

@end



// *****************************************************
int main() {
    // oc 中, 执行一些行为 [行为执行者 执行名称]
    // 利用类来创建对象
    // 执行了 Car 类的 new 行为来创建新对象
    Car *car = [Car new];
    car->wheels = 4;
    car->speed = 120;
//    car.wheels = 5; // error: property 'wheels' not found on object of type 'Car *'; did you mean to access instance variable 'wheels'
    
    NSLog(@"wheels: %d; speed: %d", car->wheels , car->speed);
    
    [car run]; // 方法的调用; 类对象发送一条 run 方法
    
    return 0;
}


