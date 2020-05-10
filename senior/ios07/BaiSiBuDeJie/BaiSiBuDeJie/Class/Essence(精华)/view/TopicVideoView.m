//
//  TopicVideoView.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/21.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <AVKit/AVKit.h>

#import "TopicVideoView.h"

#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"


@interface TopicVideoView ()

@property (weak, nonatomic) IBOutlet UIImageView *ivPic;
@property (weak, nonatomic) IBOutlet UILabel *lblDuration;

@end



@implementation TopicVideoView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
}

- (void)setTopicModel:(TopicModel *)topicModel {
    _topicModel = topicModel;
    
    self.lblDuration.text = [NSString stringWithFormat:@"%02ld:%02ld", topicModel.videotime / 60, topicModel.videotime % 60];
    
    switch ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus) {
        case AFNetworkReachabilityStatusReachableViaWWAN:
        case AFNetworkReachabilityStatusUnknown:
        case AFNetworkReachabilityStatusReachableViaWiFi: {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.ivPic sd_setImageWithURL:[NSURL URLWithString:topicModel.largeImg] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                    //        NSLog(@"%ld; %ld", receivedSize, expectedSize);
                } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
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

- (IBAction)btnVideoPlayClick:(UIButton *)sender {
//    NSLog(@"videouri: %@", self.topicModel.videouri);
    AVPlayerViewController *avPlayerVc = [[AVPlayerViewController alloc] init];
    avPlayerVc.player = [AVPlayer playerWithURL:[NSURL URLWithString:self.topicModel.videouri]];
    [avPlayerVc.player play];
    
    [[UIApplication sharedApplication].windows[0].rootViewController presentViewController:avPlayerVc animated:nil completion:^{
        
    }];
}

@end


