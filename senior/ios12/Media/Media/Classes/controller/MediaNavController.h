//
//  MediaNavController.h
//  Media
//
//  Created by Apple on 2022/9/2.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MediaNavController : UINavigationController

@property (nonatomic, assign) bool isSetAppearance;

- (void)didClickBack:(id)_id;

@end

NS_ASSUME_NONNULL_END
