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
    originalUser.name = @"yy";
    
    Status *originalStatus = [[Status alloc] init];
    originalStatus.text = @"这是原创";
    originalStatus.user = originalUser;
    
    //
    User *user = [[User alloc] init];
    user.name = @"转发的人";
    
    
    Status *status = [[Status alloc] init];
    status.retweenStatus = originalStatus;
    status.text = @"这是转发别人的";
    status.user = user;
    
    //
    [originalUser release];
    [originalStatus release];
    
    [user release];
    [status release];
    
    return 0;
}



