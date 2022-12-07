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
    NSLog(@"_armOffsetY: %f; boundsH: %f", _armOffsetY, self.bounds.size.height);
    
    // 手臂 x 偏移量
    _leftArmOffsetX = -self.ivLeftArm.frame.origin.x;
    _rightArmOffsetX = _contentView.bounds.size.width - self.ivRightHand.bounds.size.width - self.ivRightArm.frame.origin.x;
    NSLog(@"_leftArmOffsetX: %f; _rightArmOffsetX: %f", _leftArmOffsetX, _rightArmOffsetX);
    
    // 平移手臂
    self.ivLeftArm.transform = CGAffineTransformMakeTranslation(_leftArmOffsetX, _armOffsetY);
    self.ivRightArm.transform = CGAffineTransformMakeTranslation(_rightArmOffsetX, _armOffsetY);
}

- (void)startAnim:(BOOL)isClose {
    NSLog(@"isClose: %d", isClose);
    CGFloat duration = 10;
    if(isClose) {
        [UIView animateWithDuration:duration animations:^{
            _ivLeftArm.transform = CGAffineTransformIdentity;
            _ivRightArm.transform = CGAffineTransformIdentity;
            

            _ivLeftHand.transform = CGAffineTransformMakeTranslation(-_leftArmOffsetX - 20, -_armOffsetY + 20);
            _ivLeftHand.transform = CGAffineTransformScale(_ivLeftHand.transform, 0.01, 0.01);
            
            _ivRightHand.transform = CGAffineTransformMakeTranslation(-_rightArmOffsetX + 20, -_armOffsetY + 20);
            _ivRightHand.transform = CGAffineTransformScale(_ivRightHand.transform, 0.01, 0.01);
        }];
    } else {
        [UIView animateWithDuration:duration animations:^{
            _ivLeftHand.transform = CGAffineTransformIdentity;
            _ivRightHand.transform = CGAffineTransformIdentity;
            

            _ivLeftArm.transform = CGAffineTransformMakeTranslation(_leftArmOffsetX, _armOffsetY);
            _ivRightArm.transform = CGAffineTransformMakeTranslation(_rightArmOffsetX, _armOffsetY);
        }];
        
    }
}


@end


