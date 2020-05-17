//
//  CmtCell.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/5/16.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "CmtCell.h"
#import "UserModel.h"

#import "UIImageView+X.h"

@interface CmtCell()

@property (weak, nonatomic) IBOutlet UIImageView *ivProfileImage;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblLikeCount;
@property (weak, nonatomic) IBOutlet UILabel *lblContent;
@property (weak, nonatomic) IBOutlet UIButton *btnVoice;

@end



@implementation CmtCell

- (void)setCmtModel:(CmtModel *)cmtModel {
    _cmtModel = cmtModel;
//    NSLog(@"%@", cmtModel);
    
//    self.lblUserName.text = cmtModel.user.username;
    self.lblUserName.text = [NSString stringWithFormat:@"%ld - %@", cmtModel.index, cmtModel.user.username];
    self.lblContent.text = cmtModel.content;
    self.lblLikeCount.text = cmtModel.like_count;
    
    [self.ivProfileImage xCircle:cmtModel.user.profile_image placeholder:@"defaultUserIcon"];
    
    // test
//    cmtModel.voiceuri = @"111";
//    cmtModel.voicetime = @"20";
    
    if (cmtModel.voiceuri.length) {
        self.btnVoice.hidden = NO;
        [self.btnVoice setTitle:[NSString stringWithFormat:@"%@ ''", cmtModel.voicetime] forState:UIControlStateNormal];
    } else {
        self.btnVoice.hidden = YES;
    }
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

@end


