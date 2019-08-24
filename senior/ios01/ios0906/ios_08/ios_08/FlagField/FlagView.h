//
//  FlagView.h
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Flag;

@interface FlagView : UIView


@property (nonatomic, strong) Flag *flag;

//
+ (instancetype)flagViewWithFlag:(Flag *)flag;



@end
