//
//  main.m
//  oc_0315
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "User.h"
#import "Status.h"

int main() {
    
    // --
    User *originalUser = [[User alloc] init];
    originalUser.name = @"原创作者";
    
    Status *originalStatus = [[Status alloc] init];
    originalStatus.text = @"这是原创";
    originalStatus.user = originalUser;
    
    //
    User *uer = [[User alloc] init];
    uer.name = @"转发的人";
    
    
    Status *status = [[Status alloc] init];
    status.retweenStatus = originalStatus;
    status.text = @"这是转发别人的";
    status.user = uer;
    
    //
    [originalUser release];
    [originalStatus release];
    
    [uer release];
    [status release];
    
    return 0;
}



