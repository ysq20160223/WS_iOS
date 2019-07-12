//
//  MyProtocol_02.h
//  oc_0405
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyProtocol.h"
#import "MyProtocol_01.h"

// 0407
@protocol MyProtocol_02 <MyProtocol, MyProtocol_01>

- (void)requiredMethod_02;

@end


