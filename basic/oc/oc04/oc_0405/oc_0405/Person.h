//
//  Person.h
//  oc_0405
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyProtocol.h"
#import "MyProtocol_01.h"
#import "MyProtocol_02.h"

//@protocol MyProtocol;
//@protocol MyProtocol_01;
//@protocol MyProtocol_02;

// @interface Person : NSObject <MyProtocol, MyProtocol_01>
@interface Person : NSObject <MyProtocol_02>

@property (nonatomic, strong) id<MyProtocol> obj;

@end
