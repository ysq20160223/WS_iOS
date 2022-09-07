//
//  AudioGridCVCell.m
//  Media
//
//  Created by Apple on 2022/9/7.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "AudioGridCVCell.h"

#import <Masonry.h>

@implementation AudioGridCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.lblFileName.textColor = XColor(0xff, 0xff, 0xff);
    self.lblSinger.textColor = XColor(0x99, 0x99, 0x99);
    self.ivIcon.layer.cornerRadius = 6;
    self.ivIcon.layer.masksToBounds = YES;
//    self.backgroundColor = XColor(0x40, 0x40, 0x40);
    
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;

    
    [self.vBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self);
        make.top.mas_equalTo(self.lblFileName.mas_top).offset(-8);
    }];
    self.vBottom.backgroundColor = XColorAlpha(0, 0, 0, 0.5);

    
}

- (void)setAudioModel:(AudioModel *)audioModel withIndexPath:(NSIndexPath *)indexPath {
    self.ivIcon.image = [UIImage imageNamed:audioModel.icon];
//    self.ivIcon.backgroundColor = XRandomColor();
    self.lblFileName.text = audioModel.filename;
    self.lblSinger.text = audioModel.singer;
}
@end


