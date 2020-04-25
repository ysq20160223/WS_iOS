//
//  TopicViewController.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/25.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TopicViewController : UITableViewController

//@property (nonatomic, assign) TopicType topicType;
- (TopicType)topicType;

@end

NS_ASSUME_NONNULL_END
