//
//  Person.m
//  oc_0411
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"

#import "TicketDelegate.h"

@implementation Person

- (void)buyTicket {
    NSLog(@"price: %f, number: %d", _delegate.ticketPrice, _delegate.leftTicketNumber);
}

- (void)dealloc
{
    NSLog(@"");
}

@end
