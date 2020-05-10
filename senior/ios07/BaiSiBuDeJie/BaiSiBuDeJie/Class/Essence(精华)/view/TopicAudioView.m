//
//  TopicAudioView.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/21.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <AVKit/AVKit.h>

#import "TopicAudioView.h"

#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

@interface TopicAudioView ()

@property (weak, nonatomic) IBOutlet UIImageView *ivPic;


@end



@implementation TopicAudioView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTopicModel:(TopicModel *)topicModel {
    _topicModel = topicModel;
    
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


- (IBAction)btnAudioPlay:(UIButton *)sender {
    NSLog(@"voiceuri: %@", self.topicModel.voiceuri);
    
    AVPlayerViewController *avPlayerVc = [[AVPlayerViewController alloc] init];
    avPlayerVc.player = [AVPlayer playerWithURL:[NSURL URLWithString:self.topicModel.voiceuri]];
    [avPlayerVc.player play];
    
    [[UIApplication sharedApplication].windows[0].rootViewController presentViewController:avPlayerVc animated:nil completion:^{
        
    }];
}

@end
