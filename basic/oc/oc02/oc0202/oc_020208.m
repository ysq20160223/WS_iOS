//
//  oc_020208.m
//  
//
//  Created by sq y on 2017/7/8.
//
//

/*
    01, 对象和函数参数
 
    02, 方法和函数的区别
        对象方法都是以 减号- 开头
        对象方法的声明必须写在 @interface 和 @end 之间, 实现写在 @implementation 和 @end 之间
        对象方法只能由对象来调用
        对象方法归 类/对象 所有
    
        函数可以写在文件中的任意位置(@interface 和 @end 之间除外), 函数归 文件 所有
        函数的调用不依赖对象
        函数内部不能直接通过成员变量名访问某个对象的成员变量
 
 */

#import <Foundation/Foundation.h>
#import "../../../../PreHeader.h"

// 1, 声明
@interface Car : NSObject
{
    @public
    int wheels; // 不允许使用 static 修饰
    int speed;
}
- (void) run;
@end



void fun_01(Car *car)
{
    Car *c = [Car new];
    c->wheels = 6;
    c->speed = 300;
    
    car = c;
    car->wheels = 8;
}



int main()
{
    Car *car = [Car new];
    car->wheels = 4;
    car->speed = 210;
    
    fun_01(car);
    
    [car run];
    
    return 0;
}



// 2, 实现 (实现可以放在后面)
@implementation Car
- (void) run
{
    NSLog(@"wheels: %d, speed: %d - call run", wheels, speed);
}
@end




