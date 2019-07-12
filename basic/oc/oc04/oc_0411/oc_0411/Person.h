//
//  Person.h
//  oc_0411
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "TicketDelegate.h"

@interface Person : NSObject

@property (nonatomic, strong) id<TicketDelegate> delegate;

- (void) buyTicket;

@end
