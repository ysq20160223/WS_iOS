//
//  CALayer+X.h
//  Media
//
//  Created by Apple on 2020/5/24.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (X)

// 暂停动画
- (void)pauseAnimate;

// 恢复动画
- (void)resumeAnimate;

@end

NS_ASSUME_NONNULL_END


