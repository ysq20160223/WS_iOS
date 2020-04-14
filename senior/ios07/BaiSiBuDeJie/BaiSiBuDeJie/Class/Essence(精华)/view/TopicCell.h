//
//  TopicCell.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/13.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TopicModel;

NS_ASSUME_NONNULL_BEGIN

@interface TopicCell : UITableViewCell

@property (nonatomic, strong) TopicModel *topicModel;

@end

NS_ASSUME_NONNULL_END
