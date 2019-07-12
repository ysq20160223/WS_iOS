//
//  TicketDelegate.h
//  oc_0411
//
//  Created by Apple on 2017/7/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TicketDelegate <NSObject>

- (double)ticketPrice;

- (int)leftTicketNumber;

@end
