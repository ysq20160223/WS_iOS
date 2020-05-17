//
//  TopicCell.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/13.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "TopicCell.h"
#import "TopicModel.h"
#import "BSConst.h"
#import "CmtModel.h"
#import "UserModel.h"

#import "TopicPicView.h"
#import "TopicAudioView.h"
#import "TopicVideoView.h"

#import "UIView+X.h"
//#import "UIImage+X.h"
#import "UIImageView+X.h"

#import "UIImageView+WebCache.h"

@interface TopicCell()
@property (weak, nonatomic) IBOutlet UIView *vRootContent;

@property (weak, nonatomic) IBOutlet UIImageView *ivUserProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblContent;

@property (weak, nonatomic) IBOutlet UIButton *btnDing;
@property (weak, nonatomic) IBOutlet UIButton *btnCai;
@property (weak, nonatomic) IBOutlet UIButton *btnShare;
@property (weak, nonatomic) IBOutlet UIButton *btnComment;

@property (weak, nonatomic) IBOutlet UIView *vTopCmt;
@property (weak, nonatomic) IBOutlet UILabel *lblTopCmtUser;
@property (weak, nonatomic) IBOutlet UILabel *lblTopCmt;

@property (strong, nonatomic) TopicPicView *topicPicView;
@property (strong, nonatomic) TopicAudioView *topicAudioView;
@property (strong, nonatomic) TopicVideoView *topicVideoView;

@end



@implementation TopicCell

- (void)setTopicModel:(TopicModel *)topicModel {
    _topicModel = topicModel;
//    NSLog(@"%@", topicModel);
    
//    [self.ivUserProfile sd_setImageWithURL:[NSURL URLWithString:topicModel.profile_image] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        self.ivUserProfile.image = [image xCircleImage];
//    }];
    [self.ivUserProfile xCircle:topicModel.profile_image placeholder:@"defaultUserIcon"];
    self.lblName.text = topicModel.name;
    self.lblTime.text = topicModel.created_at;
    self.lblContent.text = [NSString stringWithFormat:@"%@", topicModel.text];
    
    //
    [self.btnDing setTitle:[NSString stringWithFormat:@"%ld", topicModel.ding] forState:UIControlStateNormal];
    [self.btnCai setTitle:[NSString stringWithFormat:@"%ld", topicModel.cai] forState:UIControlStateNormal];
    [self.btnShare setTitle:[NSString stringWithFormat:@"%ld", topicModel.repost] forState:UIControlStateNormal];
    [self.btnComment setTitle:[NSString stringWithFormat:@"%ld", topicModel.comment] forState:UIControlStateNormal];
    
    // 最热评论
    if (topicModel.top_cmt.count) {
        self.vTopCmt.hidden = NO;
        CmtModel *cmtModel = topicModel.top_cmt[0];
        self.lblTopCmt.text = [NSString stringWithFormat:@"%@: %@", cmtModel.user.username, cmtModel.content];
        //        NSLog(@"%@", [NSString stringWithFormat:@"%@", topicModel.top_cmt]);
    } else {
        self.vTopCmt.hidden = YES;
    }
    
    // 中间内容
    switch (topicModel.type) {
        case TopicTypeVideo:
            self.topicVideoView.hidden = NO;
            self.topicAudioView.hidden = YES;
            self.topicPicView.hidden = YES;
            self.topicVideoView.frame = topicModel.contentRect;
            self.topicVideoView.topicModel = topicModel;
            break;
            
        case TopicTypeAudio:
            self.topicAudioView.topicModel = topicModel;
            self.topicAudioView.frame = topicModel.contentRect;
            self.topicVideoView.hidden = YES;
            self.topicAudioView.hidden = NO;
            self.topicPicView.hidden = YES;
            break;
            
        case TopicTypePic:
            self.topicPicView.topicModel = topicModel;
            self.topicPicView.frame = topicModel.contentRect;
//            NSLog(@"%@ - %@", topicModel.name, NSStringFromCGRect(topicModel.contentRect));
//            CGRect rect = topicModel.contentRect;
//            rect.size.height = topicModel.height;
//            self.topicPicView.frame = rect;
            
            self.topicVideoView.hidden = YES;
            self.topicAudioView.hidden = YES;
            self.topicPicView.hidden = NO;
            break;
            
        case TopicTypeWord:
            self.topicVideoView.hidden = YES;
            self.topicAudioView.hidden = YES;
            self.topicPicView.hidden = YES;
            break;
            
        default:
            break;
    }
}

- (void)setFrame:(CGRect)frame {
    frame.size.height -= BSMargin;
    //    frame.origin.x += BSMargin;
    frame.origin.y += BSMargin;
    //    frame.size.width -= 2 * BSMargin;
    [super setFrame:frame];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

#pragma mark - Click
- (IBAction)clickBtnMore:(UIButton *)sender {
    //    XLog
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [ac addAction:[UIAlertAction actionWithTitle:@"Collection" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Collection");
    }]];
    [ac addAction:[UIAlertAction actionWithTitle:@"Inform" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Inform");
    }]];
    [ac addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel");
    }]];
    
    [self.window.rootViewController presentViewController:ac animated:YES completion:nil];
}


#pragma mark - lazy load start
- (TopicPicView *)topicPicView {
    if (!_topicPicView) {
        _topicPicView = [TopicPicView xViewFromXib];
        [self.vRootContent addSubview:_topicPicView];
    }
    return _topicPicView;
}

- (TopicVideoView *)topicVideoView {
    if (!_topicVideoView) {
        _topicVideoView = [TopicVideoView xViewFromXib];
        [self.vRootContent addSubview:_topicVideoView];
    }
    return _topicVideoView;
}

- (TopicAudioView *)topicAudioView {
    if (!_topicAudioView) {
        _topicAudioView = [TopicAudioView xViewFromXib];
        [self.vRootContent addSubview:_topicAudioView];
    }
    return _topicAudioView;
}
#pragma mark - lazy load end

@end


