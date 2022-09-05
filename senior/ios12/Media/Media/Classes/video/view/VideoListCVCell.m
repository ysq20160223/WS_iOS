//
//  VideoListCVCell.m
//  Media
//
//  Created by Apple on 2022/9/4.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "VideoListCVCell.h"

@implementation VideoListCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.lblName.textColor = XColor(0xee, 0xee, 0xee);
    self.lblAuthor.textColor = XColor(0x88, 0x88, 0x88);
    self.backgroundColor = XColor(0x40, 0x40, 0x40);
    
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    
}

- (void)setVideoModel:(VideoModel *)videoModel withIndexPath:(NSIndexPath *)indexPath {
    self.ivIcon.image = [UIImage imageNamed:videoModel.icon];
    self.lblName.text = videoModel.name;
    self.lblAuthor.text = videoModel.author;
}

@end


