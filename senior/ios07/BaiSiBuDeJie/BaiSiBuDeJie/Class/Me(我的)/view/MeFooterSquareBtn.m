//
//  MeFooterSquareView.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/29.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "MeFooterSquareBtn.h"
#import "UIView+X.h"

#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@implementation MeFooterSquareBtn

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.xY = self.xHeight * 0.15;
    self.imageView.xHeight = self.xHeight * 0.5;
    self.imageView.xWidth = self.imageView.xHeight;
    self.imageView.xCenterX = self.xWidth * 0.5;
    
    self.titleLabel.xX = 0;
    self.titleLabel.xWidth = self.xWidth;
    self.titleLabel.xY = self.imageView.xBottom;
    self.titleLabel.xHeight = self.xHeight - self.titleLabel.xY;
}

#pragma mark -
- (void)setSquareModel:(MeFooterSquareModel *)squareModel {
    _squareModel = squareModel;
    
    [self setTitle:squareModel.name forState:UIControlStateNormal];
    
    [self sd_setImageWithURL:[NSURL URLWithString:squareModel.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"mine-icon-recentHot"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
//            NSLog(@"error: %@", error);
        }
    }];
    
    //        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:model.icon] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    //
    //        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
    //            [btn setImage:image forState:UIControlStateNormal];
    //        }];
}

@end


