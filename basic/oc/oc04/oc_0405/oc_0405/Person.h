//
//  Person.h
//  oc_0405
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyProtocol.h"
#import "MyProtocol_A.h"
#import "MyProtocol_B.h"

//@protocol MyProtocol;
//@protocol MyProtocol_A;
//@protocol MyProtocol_B;

// @interface Person : NSObject <MyProtocol, MyProtocol_A>
@interface Person : NSObject <MyProtocol_B>

@property (nonatomic, strong) id<MyProtocol> obj;

@end


