//
//  ViewController.m
//  ios_020601
//
//  Created by Apple on 2017/7/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
 storyboard :
 UIToolBar的基本使用
 xib文件的基本使用 : 描述软件界面
 代理模式
 MVC模式
 */

#import "ViewController.h"

#import "RowView.h"
#import "UIView+X.h"

#import <Masonry.h>

#define kRowH 66
#define kRowDivider 10

@interface ViewController () /// 类扩展(class extension, 匿名分类)
//{
//    int _screenW;
//}
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _toolBar.frame = CGRectMake(0, kStatusBarH, kScreenW, _toolBar.xHeight);
}

- (IBAction)onClickAdd:(UIBarButtonItem *)sender {
    UIView *lastView = [self.view.subviews lastObject];
    for (NSInteger i = self.view.subviews.count - 1; i >= 0; i--) {
        lastView = self.view.subviews[i];
        //        NSLog("%ld; %@; %@", i, lastView, lastView.class);
        if (!lastView.isHidden) {
            break;
        }
    }
    //    NSLog(@"%@", lastView);
    CGFloat rowY = lastView.xY + lastView.xHeight + kRowDivider;
    
    
    UIView *rowView;
    if (self.view.subviews.count % 3 == 0) {
        rowView = [self createRowViewWithCode];
    } else if (self.view.subviews.count % 3 == 1) {
        rowView = [self createRowViewWithXib];
    } else if (self.view.subviews.count % 3 == 2) {
        rowView = [self createRowViewWithRowView];
    }
    
    [self.view addSubview:rowView];
    
    rowView.frame = CGRectMake(kScreenW, rowY, kScreenW, kRowH);
    rowView.alpha = 0;
    //    NSLog(@"%@", rowView);
    [UIView animateWithDuration:1 animations:^{
        rowView.frame = CGRectMake(0, rowY, kScreenW, kRowH);
        rowView.alpha = 1;
        
        //        for (NSInteger i = 0; i < self.view.subviews.count; i++) {
        //            NSLog("%ld; %@", i, self.view.subviews[i]);
        //        }
    } completion:^(BOOL finished) {
        _barBtnTrash.enabled = YES;
    }];
}


// *******************************
// 020616 自定义 View
// *******************************
- (UIView *)createRowViewWithRowView {
    XLog
    int randomIndex = arc4random_uniform(9);
    NSString *iconName = [NSString stringWithFormat:@"01%d.png", randomIndex];
    NSString *labelName = [NSString stringWithFormat:@"RowView: %d", randomIndex];
    
    RowView *rowView = [RowView rowViewWithIcon:iconName andName:labelName];
    [rowView.btnIcon addTarget:self action:@selector(onClickIcon:) forControlEvents:UIControlEventTouchUpInside];
    [rowView.btnDelete addTarget:self action:@selector(onClickDelete:) forControlEvents:UIControlEventTouchUpInside];
    return rowView;
}


// *******************************
// 020612 从 xib 中加载一行 view
// *******************************
- (UIView *)createRowViewWithXib {
    XLog
    // 当 File's Owner 为 self 时, 并且 xib 的 class 设置为所在 ViewController 时, xib 中的控件才可以连线到 ViewController 中
    
    // 1, 创建 objects 下面所有的控件, 并且按顺序装到数组中返回
    // 2, 取出一行
    UIView *rowView = [UIView xLoadNibNamed:@"RowViewXib"];
    
    // 3, 设置头像
    int randomIndex = arc4random_uniform(9);
    
    UIButton *btnIcon = (UIButton *)[rowView viewWithTag:1];
    NSString *iconName = [NSString stringWithFormat:@"01%d.png", randomIndex];
    [btnIcon setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [btnIcon addTarget:self action:@selector(onClickIcon:) forControlEvents:UIControlEventTouchUpInside];
    
    // 4, 设置姓名
    UILabel *lblName = (UILabel *)[rowView viewWithTag:2];
    lblName.text = [NSString stringWithFormat:@"RowViewXib.xib: %d", randomIndex];
    
    // 5, 监听删除按钮
    // 可以使用下面两行代码; 或者将 xib 中的按钮连接到 ViewController; // 两种都不建议, 建议方法应该是封装代码
    UIButton *btnDelete = (UIButton *)[rowView viewWithTag:3];
    [btnDelete addTarget:self action:@selector(onClickDelete:) forControlEvents:UIControlEventTouchUpInside];
    
    return rowView;
}


// *******************************
// 020606 代码创建
// *******************************
- (UIView *)createRowViewWithCode {
    XLog
    // 创建控件
    UIView *rowView = UIView.alloc.init;
    rowView.backgroundColor = UIColor.magentaColor;
    
    UIButton *btnIcon = [UIButton buttonWithType:UIButtonTypeCustom]; // 1, 添加头像
    btnIcon.frame = CGRectMake(0, 0, kRowH, kRowH);
    
    int randomIndex = arc4random_uniform(9); // arc4random() % 9
    NSString *iconName = [NSString stringWithFormat:@"01%d.png", randomIndex];
    [btnIcon setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [btnIcon addTarget:self action:@selector(onClickIcon:) forControlEvents:UIControlEventTouchUpInside];
    btnIcon.tag = 1;
    [rowView addSubview:btnIcon];
    
    UILabel *lblName = UILabel.alloc.init; // 2, 添加名字 (标签)
    lblName.frame = CGRectMake(0, 0, kScreenW, kRowH);
    lblName.textAlignment = NSTextAlignmentCenter;
    lblName.text = [NSString stringWithFormat:@"code: %d", randomIndex];
    lblName.tag = 2;
    [rowView addSubview:lblName];
    
    // 020610
    UIButton *btnDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect]; // 3, 每行的删除按钮
    [rowView addSubview:btnDelete];
    [btnDelete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(rowView);
        make.right.equalTo(rowView).offset(-10);
    }];
    [btnDelete setTitle:@"delete" forState:UIControlStateNormal];
    [btnDelete addTarget:self action:@selector(onClickDelete:) forControlEvents:UIControlEventTouchUpInside];
    btnDelete.backgroundColor = UIColor.orangeColor;
    
    return rowView;
}

// 每一行的 delete
- (void)onClickDelete:(UIButton *)btn {
    XLog
    [UIView animateWithDuration:1 animations:^{
        _barBtnTrash.enabled = NO;
        
        CGRect rect = btn.superview.frame;
        rect.origin.x = kScreenW;
        btn.superview.frame = rect;
        btn.superview.alpha = 0;
    } completion:^(BOOL finished) {
        long startIndex = [self.view.subviews indexOfObject:btn.superview];
        [btn.superview removeFromSuperview];
        
        [UIView animateWithDuration:1 animations:^{
            for (long i = startIndex; i < self.view.subviews.count; i++) {
                UIView *subView = self.view.subviews[i];
                CGRect rect = subView.frame;
                rect.origin.y -= kRowH + kRowDivider;
                subView.frame = rect;
            }
        } completion:^(BOOL finished) {
            _barBtnTrash.enabled = [self subViewsCount] != 1;
        }];
    }];
}

// 020608
- (void)onClickIcon:(UIButton *)icon {
    UIButton *btnIconInfo = [icon.superview viewWithTag:1];
    UILabel *label = [icon.superview viewWithTag:2];
    UIButton *btnDelete = [icon.superview viewWithTag:3];
    NSLog(@"%@; %@; %@", btnIconInfo, label.text, btnDelete);
}


- (IBAction)onClickTrash:(UIBarButtonItem *)sender {
    UIView *lastView = [self.view.subviews lastObject];
    
    [UIView animateWithDuration:1 animations:^{
        _barBtnTrash.enabled = NO;
        
        CGRect rect = lastView.frame;
        rect.origin.x = kScreenW;
        lastView.frame = rect;
        lastView.alpha = 0;
    } completion:^(BOOL finished) {
        [lastView removeFromSuperview];
        _barBtnTrash.enabled = [self subViewsCount] != 1;
    }];
}

- (NSInteger)subViewsCount {
    NSInteger count = 0;
    for (NSInteger i = 0; i < self.view.subviews.count; i++) {
        if (!self.view.subviews[i].isHidden) {
            count++;
        }
    }
    return count;
}

@end


