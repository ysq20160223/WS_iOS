//
//  MyNewFeatureViewCell.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XNewFeatureViewCell.h"

#import "UIView+Frame.h"

#import "XTabBarController.h"


@interface XNewFeatureViewCell ()

@property (nonatomic, weak) UIImageView *imageView;

//
@property (nonatomic, weak) UIButton *startButton;

@end



@implementation XNewFeatureViewCell

- (UIButton *)startButton {
    if (_startButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.center = CGPointMake(self.width * .5, self.height * .95);
        [self addSubview:btn];
        _startButton = btn;
        
        //
        [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchDown];
    }
    return _startButton;
}

// 点击立即体验按钮
- (void)start {
    // 跳转到主界面
    // 修改窗口的根控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = [[XTabBarController alloc] init];
    
}

- (UIImageView *)imageView {
    if(_imageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _imageView = imageView;
        [self.contentView addSubview:imageView];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.imageView.image = image;
    self.imageView.frame = self.bounds;
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count {
    if (indexPath.item == count - 1 ) {
        self.startButton.hidden = NO;
    } else {
        self.startButton.hidden = YES;
    }
}

@end


