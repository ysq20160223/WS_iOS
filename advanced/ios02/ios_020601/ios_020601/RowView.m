//
//  RowView.m
//  ios_020601
//
//  Created by Apple on 2017/7/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RowView.h"

#import "UIView+X.h"

@implementation RowView

+ (void)load {
    XLog
}

+ (void)initialize {
    XLog
}

+ (id)rowViewWithIcon:(NSString *)icon andName:(NSString *)name {
//    RowView *view = [NSBundle.mainBundle loadNibNamed:@"RowView" owner:nil options:nil][0];
    RowView *view = [RowView xLoadNibNamed];
    
//    // 1, 设置图标
//    UIButton *iconBtn = (UIButton *)[view viewWithTag:1];
//    [iconBtn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
//    
//    // 2, 设置姓名
//    UILabel *nameLabel = (UILabel *)[view viewWithTag:2];
//    nameLabel.text = name;
    
    
    [view.btnIcon setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    view.lblName.text = name;
    
    return view;
}


@end


