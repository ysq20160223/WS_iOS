//
//  main.m
//  oc_0315
//
//  Created by Apple on 2017/7/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PrefixHeader.pch"

#import "User.h"
#import "Status.h"

int main() {
    
    // ----- JJ 发表微博 今天天气不错
    User *originalUser = [[User alloc] init];
    originalUser.userName = @"JJ";
    
    Status *originalStatus = [[Status alloc] init];
    originalStatus.content = @"今天天气不错";
    originalStatus.user = originalUser;
    
    // ----- SB 转发 JJ微博 并附加 今天天气真的不错
    User *user = [[User alloc] init];
    user.userName = @"SB";
    
    Status *status = [[Status alloc] init];
    status.retweenStatus = originalStatus;
    status.content = @"今天天气真的不错";
    status.user = user;
    
    //
    [originalUser release];
    [originalStatus release];
    
    [user release];
    [status release];
    
    return 0;
}



