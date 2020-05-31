//
//  LrcScrollView.h
//  Media
//
//  Created by Apple on 2020/5/24.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LrcLabel;

NS_ASSUME_NONNULL_BEGIN

@interface LrcScrollView : UIScrollView

@property (nonatomic, copy) NSString *lrcName;

@property (nonatomic, assign) NSTimeInterval lrcCurTime;

@property (nonatomic, strong) LrcLabel *lrcLabel;

@end

NS_ASSUME_NONNULL_END
