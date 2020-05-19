//
//  BSConst.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/28.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MJExtension.h"

#import "BSConst.h"

#import "TopicModel.h"
#import "CmtModel.h"
#import "UserModel.h"

CGFloat const BSMarginLeft = 16;
CGFloat const BSMargin = 10;


// URL
NSString *const commonUrl = @"http://api.budejie.com/api/api_open.php";

//
NSString *const TabBarBtnDidRepeatClickNotification = @"TabBarBtnDidRepeatClickNotification";

//
NSString *const TitleBtnDidRepeatClickNotification = @"TitleBtnDidRepeatClickNotification";

@implementation BSConst

+ (void)load {
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
            @"ID" : @"id"
        };
    }];
    
    [TopicModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
            @"top_cmt" : [CmtModel class],
        };
    }];
    
    [TopicModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
            @"ID" : @"id",
            @"smallImg" : @"image0",
            @"middleImg" : @"image2",
            @"largeImg" : @"image1"
        };
    }];
    
}

@end

