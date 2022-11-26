//
//  LoginAnimView.m
//  ios_04
//
//  Created by Apple on 2017/8/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LoginAnimView.h"

@interface LoginAnimView ()

@property (weak, nonatomic) IBOutlet UIImageView *ivLeftHand;
@property (weak, nonatomic) IBOutlet UIImageView *ivRightHand;

@property (weak, nonatomic) IBOutlet UIImageView *ivLeftArm;
@property (weak, nonatomic) IBOutlet UIImageView *ivRightArm;

//
@property (nonatomic, assign) CGFloat armOffsetY;
@property (nonatomic, assign) CGFloat leftArmOffsetX;
@property (nonatomic, assign) CGFloat rightArmOffsetX;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end



@implementation LoginAnimView

+ (instancetype)loginAnimView {
    return [NSBundle.mainBundle loadNibNamed:NSStringFromClass(LoginAnimView.class) owner:nil options:nil].firstObject;
}

//
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 初始化手臂位置
    // y 偏移量
    _armOffsetY = self.bounds.size.height - self.ivLeftArm.frame.origin.y;
    // 左手臂 x 偏移量
    _leftArmOffsetX = -self.ivLeftArm.frame.origin.x;
    
    // 右边手臂 x 偏移量
    _rightArmOffsetX = _contentView.bounds.size.width - self.ivRightHand.bounds.size.width - self.ivRightArm.frame.origin.x;
    
    // 平移左边手臂
    self.ivLeftArm.transform = CGAffineTransformMakeTranslation(_leftArmOffsetX, _armOffsetY);
    
    // 平移右边手臂
    self.ivRightArm.transform = CGAffineTransformMakeTranslation(_rightArmOffsetX, _armOffsetY);
}

- (void)startAnim:(BOOL)isClose {
    CGFloat duration = 3;
    if(isClose) {
        // 清空形变
        [UIView animateWithDuration:duration animations:^{
            // 移动手臂
            self.ivLeftArm.transform = CGAffineTransformIdentity;
            self.ivRightArm.transform = CGAffineTransformIdentity;
            
            // 手
            self.ivLeftHand.transform = CGAffineTransformMakeTranslation(-_leftArmOffsetX - 8, -_armOffsetY + 8);
            self.ivLeftHand.transform = CGAffineTransformScale(self.ivLeftHand.transform, 0.01, 0.01);
            
            self.ivRightHand.transform = CGAffineTransformMakeTranslation(-_rightArmOffsetX + 8, -_armOffsetY + 8);
            self.ivRightHand.transform = CGAffineTransformScale(self.ivRightHand.transform, 0.01, 0.01);
            
        }];
    } else {
        [UIView animateWithDuration:duration animations:^{
            // 平移左边手臂
            self.ivLeftArm.transform = CGAffineTransformMakeTranslation(_leftArmOffsetX, _armOffsetY);
            
            // 平移右边手臂
            self.ivRightArm.transform = CGAffineTransformMakeTranslation(_rightArmOffsetX, _armOffsetY);
            
            //
            self.ivLeftHand.transform = CGAffineTransformIdentity;
            self.ivRightHand.transform = CGAffineTransformIdentity;
        }];
        
    }
}


@end


