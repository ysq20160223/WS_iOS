//
//  LoginAnimView.m
//  ios_04
//
//  Created by Apple on 2017/8/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LoginAnimView.h"

@interface LoginAnimView ()

@property (weak, nonatomic) IBOutlet UIImageView *leftHand;
@property (weak, nonatomic) IBOutlet UIImageView *rightHand;

@property (weak, nonatomic) IBOutlet UIImageView *leftArm;
@property (weak, nonatomic) IBOutlet UIImageView *rightArm;

//
@property (nonatomic, assign) CGFloat armOffsetY;
@property (nonatomic, assign) CGFloat leftArmOffsetX;
@property (nonatomic, assign) CGFloat rightArmOffsetX;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation LoginAnimView

+ (instancetype)loginAnimView {
    return [[NSBundle mainBundle] loadNibNamed:@"LoginAnimView" owner:nil options:nil][0];
}

//
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 初始化手臂位置
    // y 偏移量
    _armOffsetY = self.bounds.size.height - _leftArm.frame.origin.y;
    // 左手臂 x 偏移量
    _leftArmOffsetX = -_leftArm.frame.origin.x;
    
    // 右边手臂 x 偏移量
    _rightArmOffsetX = _contentView.bounds.size.width - _rightHand.bounds.size.width - _rightArm.frame.origin.x;
    
    // 平移左边手臂
    _leftArm.transform = CGAffineTransformMakeTranslation(_leftArmOffsetX, _armOffsetY);
    
    // 平移右边手臂
    _rightArm.transform = CGAffineTransformMakeTranslation(_rightArmOffsetX, _armOffsetY);
}

- (void)startAnim:(BOOL)isClose {
    if(isClose) {
        // 清空形变
        [UIView animateWithDuration:.2 animations:^{
            // 移动手臂
            _leftArm.transform = CGAffineTransformIdentity;
            _rightArm.transform = CGAffineTransformIdentity;
            
            // 手
            _leftHand.transform = CGAffineTransformMakeTranslation(-_leftArmOffsetX, -_armOffsetY + 5);
            _leftHand.transform = CGAffineTransformScale(_leftHand.transform, 0.01, 0.01);
            
            _rightHand.transform = CGAffineTransformMakeTranslation(-_rightArmOffsetX, -_armOffsetY + 5);
            _rightHand.transform = CGAffineTransformScale(_rightHand.transform, 0.01, 0.01);
            
        }];
    } else {
        [UIView animateWithDuration:.2 animations:^{
            // 平移左边手臂
            _leftArm.transform = CGAffineTransformMakeTranslation(_leftArmOffsetX, _armOffsetY);
            
            // 平移右边手臂
            _rightArm.transform = CGAffineTransformMakeTranslation(_rightArmOffsetX, _armOffsetY);
            
            //
            _leftHand.transform = CGAffineTransformIdentity;
            _rightHand.transform = CGAffineTransformIdentity;
        }];
        
    }
}


@end





