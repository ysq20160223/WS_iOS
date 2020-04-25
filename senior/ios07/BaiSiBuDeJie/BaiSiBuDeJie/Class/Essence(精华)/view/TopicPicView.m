//
//  TopicPicView.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/21.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "TopicPicView.h"
#import "TopicModel.h"

#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

@interface TopicPicView ()

@property (weak, nonatomic) IBOutlet UIImageView *ivPic;
@property (weak, nonatomic) IBOutlet UIImageView *ivGif;
@property (weak, nonatomic) IBOutlet UIButton *btnSeeBig;

@end



@implementation TopicPicView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTopicModel:(TopicModel *)topicModel {
    self.ivPic.hidden = YES;
    self.ivGif.hidden = !topicModel.is_gif;
    self.btnSeeBig.hidden = !topicModel.isBigPic;
    
    if (topicModel.isBigPic) {
        self.ivPic.contentMode = UIViewContentModeTop;
    } else {
        self.ivPic.contentMode = UIViewContentModeScaleToFill;
    }
    
    switch ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus) {
        case AFNetworkReachabilityStatusReachableViaWWAN:
        case AFNetworkReachabilityStatusUnknown:
        case AFNetworkReachabilityStatusReachableViaWiFi: {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.ivPic sd_setImageWithURL:[NSURL URLWithString:topicModel.largeImg] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
               
                    //        NSLog(@"%ld; %ld", receivedSize, expectedSize);
                } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    self.ivPic.hidden = NO;
                    //        NSLog(@"");
                }];
            });
        }
            break;
            
        case AFNetworkReachabilityStatusNotReachable:
            XLog
            break;
    }
}

@end


