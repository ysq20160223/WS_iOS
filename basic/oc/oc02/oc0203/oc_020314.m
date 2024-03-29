//
//  oc_020314.m
//
//
//  Created by Apple on 2017/7/9.
//
//

/*
 01, 继承
 */

#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"

// *************************************
@interface Animal : NSObject {
    int _age;
    int _weight;
}

- (void)setAge:(int)age;
- (int)age;

- (void)setWeight:(int)weight;
- (int)weight;
@end


@implementation Animal : NSObject
- (void)setAge:(int)age {
    XLog
    _age = age;
}

- (int)age {
    XLog
    return _age;
}

- (void)setWeight:(int)weight {
    _weight = weight;
}

- (int)weight {
    return _weight;
}
@end



// *************************************
@interface Dog : Animal
@end


@implementation Dog
@end



// *************************************
@interface Cat : Animal
@end


@implementation Cat
@end



// *************************************
int main() {
//    Dog *dog = Dog.new;
    Dog *dog = Dog.new.init;
//    [dog setAge:1];
//    NSLog(@"dog age: %d", [dog age]);
    
    dog.age = 1;
    NSLog(@"dog age: %d", dog.age);
    return 0;
}


