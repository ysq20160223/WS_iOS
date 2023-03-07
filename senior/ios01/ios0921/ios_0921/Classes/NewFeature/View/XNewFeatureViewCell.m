//
//  XNewFeatureViewCell.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XNewFeatureViewCell.h"

#import "UIView+X.h"

#import "XTbc.h"


@interface XNewFeatureViewCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, weak) UIButton *startButton;

@end



@implementation XNewFeatureViewCell

- (UIButton *)startButton {
    if (!_startButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.center = CGPointMake(self.xWidth * .5, self.xHeight * .95);
        [self addSubview:btn];
        _startButton = btn;
        
        //
        [btn addTarget:self action:@selector(didClickStartButton:) forControlEvents:UIControlEventTouchDown];
    }
    return _startButton;
}

// 点击立即体验按钮
- (void)didClickStartButton:(id)_id {
    // 跳转到主界面
    // 修改窗口的根控制器
    UIApplication.sharedApplication.keyWindow.rootViewController = XTbc.alloc.init;
    
}

- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = UIImageView.alloc.init;
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.imageView.image = image;
    self.imageView.frame = self.bounds;
//    self.imageView.backgroundColor = XRandomColor();
//    NSLog(@"%@; %@", self.imageView, NSStringFromCGRect(self.imageView.frame));
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count {
//    if (indexPath.item == count - 1) {
//        self.startButton.hidden = NO;
//    } else {
//        self.startButton.hidden = YES;
//    }
    self.startButton.hidden = indexPath.item != count - 1;
}

@end


