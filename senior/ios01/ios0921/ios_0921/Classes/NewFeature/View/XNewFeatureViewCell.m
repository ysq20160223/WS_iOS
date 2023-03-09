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

@property (nonatomic, strong) UIImageView *iv;
@property (nonatomic, weak) UIButton *btnStart;

@end



@implementation XNewFeatureViewCell

- (UIButton *)btnStart {
    if (!_btnStart) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.center = CGPointMake(self.xWidth * .5, self.xHeight * .95);
        [self addSubview:btn];
        _btnStart = btn;
        
        //
        [btn addTarget:self action:@selector(didClickStartButton:) forControlEvents:UIControlEventTouchDown];
    }
    return _btnStart;
}

// 点击立即体验按钮
- (void)didClickStartButton:(id)_id {
    // 跳转到主界面
    // 修改窗口的根控制器
    UIApplication.sharedApplication.keyWindow.rootViewController = XTbc.alloc.init;
    
}

- (UIImageView *)iv {
    if(!_iv) {
        _iv = UIImageView.alloc.init;
        [self.contentView addSubview:_iv];
    }
    return _iv;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.iv.image = image;
    self.iv.frame = self.bounds;
//    self.iv.contentMode = UIViewContentModeScaleAspectFit;
//    self.iv.backgroundColor = XRandomColor();
//    self.iv.backgroundColor = UIColor.darkGrayColor;
    NSLog(@"%@; %@", self.iv, NSStringFromCGRect(self.iv.frame));
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count {
    NSLog(@"%ld; %@", indexPath.item, indexPath);
//    if (indexPath.item == count - 1) {
//        self.startButton.hidden = NO;
//    } else {
//        self.startButton.hidden = YES;
//    }
    self.btnStart.hidden = indexPath.item != count - 1;
}

@end


