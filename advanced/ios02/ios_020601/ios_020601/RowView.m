//
//  RowView.m
//  ios_020601
//
//  Created by Apple on 2017/7/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RowView.h"

@implementation RowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (id)rowViewWithIcon:(NSString *)icon andName:(NSString *)name {
    RowView *view = [[NSBundle mainBundle] loadNibNamed:@"RowView" owner:nil options:nil][0];
    
    
//    // 1, 设置图标
//    UIButton *iconBtn = (UIButton *)[view viewWithTag:1];
//    [iconBtn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
//    
//    // 2, 设置姓名
//    UILabel *nameLabel = (UILabel *)[view viewWithTag:2];
//    nameLabel.text = name;
    
    
    [view.iconBtn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    view.nameLabel.text = name;
    
    [view setBackgroundColor:[UIColor lightGrayColor]];
    
    return view;
}


- (IBAction)iconBtnClick:(UIButton *)sender {
}

- (IBAction)deleteBtnClick:(UIButton *)sender {
}
@end
