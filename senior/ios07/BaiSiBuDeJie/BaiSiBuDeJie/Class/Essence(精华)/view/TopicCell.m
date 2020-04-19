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

#import "UIImageView+WebCache.h"

@interface TopicCell()

@property (weak, nonatomic) IBOutlet UIImageView *ivUserProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblContent;

@property (weak, nonatomic) IBOutlet UIButton *btnDing;
@property (weak, nonatomic) IBOutlet UIButton *btnCai;
@property (weak, nonatomic) IBOutlet UIButton *btnShare;
@property (weak, nonatomic) IBOutlet UIButton *btnComment;

@property (weak, nonatomic) IBOutlet UIView *vTopCmt;
@property (weak, nonatomic) IBOutlet UILabel *lblTopCmt;

@end



@implementation TopicCell

- (void)setTopicModel:(TopicModel *)topicModel {
    _topicModel = topicModel;
//    NSLog(@"%ld", topicModel.type);
    
    [self.ivUserProfile sd_setImageWithURL:[NSURL URLWithString:topicModel.profile_image]];
    self.lblName.text = topicModel.name;
    self.lblTime.text = topicModel.created_at;
    self.lblContent.text = topicModel.text;
    
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
            
            break;
            
        case TopicTypeAudio:
            
            break;
            
        case TopicTypePic:
            
            break;
            
        case TopicTypeWord:
            
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


#pragma mark - Click
- (IBAction)clickBtnMore:(UIButton *)sender {
    //    XLog
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
    
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

@end


