//
//  XRefreshHeader.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/11.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "XRefreshHeader.h"

#import "UIView+X.h"

@interface XRefreshHeader()

@property (nonatomic, strong)UIImageView *topImageView;

@end



@implementation XRefreshHeader

- (void)prepare {
    [super prepare];
    
    self.automaticallyChangeAlpha = YES;
    self.lastUpdatedTimeLabel.textColor = [UIColor blackColor];
    self.stateLabel.textColor = [UIColor blackColor];
    
    //
    UIImageView *topImageView = [[UIImageView alloc] init];
    topImageView.image = [UIImage imageNamed:@"AppIcon"];
    [self addSubview:topImageView];
    self.topImageView = topImageView;
}

- (void)placeSubviews {
    [super placeSubviews];
    
    self.topImageView.xWidth = 50;
    self.topImageView.xHeight = 50;
    self.topImageView.xCenterX = self.xCenterX;
    self.topImageView.xY = -50;
}

@end


