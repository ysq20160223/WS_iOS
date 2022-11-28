//
//  AudioListCVCell.m
//  Media
//
//  Created by Apple on 2022/9/3.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "AudioListCVCell.h"

@implementation AudioListCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.lblFileName.textColor = XColor(0xee, 0xee, 0xee);
    self.lblSinger.textColor = XColor(0x88, 0x88, 0x88);
    self.ivIcon.layer.cornerRadius = 6;
    self.ivIcon.layer.masksToBounds = YES;
    self.backgroundColor = XColor(0x44, 0x44, 0x44);
    
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    
}

- (void)setAudioModel:(AudioModel *)audioModel withIndexPath:(NSIndexPath *)indexPath {
    self.ivIcon.image = [UIImage imageNamed:audioModel.icon];
    self.lblFileName.text = audioModel.filename;
    self.lblSinger.text = audioModel.singer;
}

@end


