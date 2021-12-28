//
//  Employee.h
//  oc_020510
//
//  Created by Apple on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Work.h"

@interface Employee : Work

@property int no;

- (id)initWithNo:(int)no;

- (id)initWithNo:(int)no andName:(NSString *)name;

@end
