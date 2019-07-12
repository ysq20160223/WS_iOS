//
//  oc_020319.m
//  
//
//  Created by sq y on 2017/7/9.
//
//

/*
    01, 多态 - 父类指针指向子类对象
        继承是多态的前提
        局限性 : 父类类型的变量不建议直接调用子类特有的方法, warning
 */

#import <Foundation/Foundation.h>
#import "../../../../PreHeader.h"

// ---
@interface Animal : NSObject
- (void)eat;
@end


@implementation Animal
- (void)eat {
    NSLog(@"Animal eat");
}
@end


// ---
@interface Dog : Animal
- (void)run;
@end

@implementation Dog
- (void)eat {
    NSLog(@"Dog eat");
}

- (void)run {
    NSLog(@"Dog run");
}
@end


// ---
void eat(Animal *animal) {
    [animal eat];
}


// ---
int main() {
    Animal *animal = [Dog new];
    
    // [animal eat];
    eat(animal);
    
//    [animal run]; // warning, java 中会报错
    
    Dog *dog = (Dog *)animal; // 强制转化
    [dog run];
    
    
    return 0;
}



