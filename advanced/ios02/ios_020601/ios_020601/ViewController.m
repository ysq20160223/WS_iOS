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
#import "../../../../PreHeader.h"

#import "RowView.h"

#define kRowHeight 77
#define kIconWidth kRowHeight

#define kRowDivider 10

// 类扩展(class extension, 匿名分类)
@interface ViewController ()
{

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _toolBar.frame = CGRectMake(0, 20, self.view.frame.size.width, _toolBar.frame.size.height);
}

- (IBAction)add:(UIBarButtonItem *)sender {
//    NSLog(@"add");
    UIView *lastView = [self.view.subviews lastObject];
    
    CGFloat rowY = lastView.frame.origin.y + lastView.frame.size.height + kRowDivider;

    // 1, 创建行
//    UIView *rowView = [self createRowView];
    
    UIView *rowView;
    
    if (self.view.subviews.count % 3 == 0) {
        rowView = [self createRowViewWithCode];
    } else if (self.view.subviews.count % 3 == 1){
        rowView = [self createRowViewWithXib];
    } else if (self.view.subviews.count % 3 == 2){
        rowView = [self createRowViewWithRowView];
    }
    
    
    [self.view addSubview:rowView]; // 2, 添加一行到控制器的view中
    
    _removeItem.enabled = YES; // 3, 右边删除图标 enable
    
    int screenW = self.view.frame.size.width;
    // 4, 执行动画
    rowView.frame = CGRectMake(screenW, rowY, screenW, kRowHeight);
    rowView.alpha = 0.0;
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
    
    [UIView animateWithDuration:0.5 animations:^{
        rowView.frame = CGRectMake(0, rowY, screenW, kRowHeight);
        rowView.alpha = 1;
    }]; // 官方推荐使用
    
//    [UIView commitAnimations];
}


// *******************************
// 020616
// *******************************
// 自定义 View
- (UIView *)createRowViewWithRowView {
    
    int randomIndex = arc4random_uniform(9);
    
    NSString *iconName = [NSString stringWithFormat:@"01%d.png", randomIndex];
    NSString *labelName = [NSString stringWithFormat:@"loadNibName: %d", randomIndex];
    
    RowView *rowView = [RowView rowViewWithIcon:iconName andName:labelName];
    
    [rowView.iconBtn addTarget:self action:@selector(iconClick:) forControlEvents:UIControlEventTouchUpInside];
    [rowView.deleteBtn addTarget:self action:@selector(deleteClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return rowView;
}


// *******************************
// 020612
// *******************************
// 从 xib 中加载一行 view
- (UIView *)createRowViewWithXib {
    // 1, 创建 objects 下面所有的控件, 并且按顺序装到数组中返回
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"RowView" owner:self options:nil];
    
    // 当 owner 为 self 时, 并且 xib 的 class 设置为所在 ViewController 时, xib 中的控件才可以连线到 ViewController 中
//    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"RowView" owner:self options:nil];
    

    // 2, 取出一行
    UIView *rowView = views[0];
    
    // 3, 设置头像
    int randomIndex = arc4random_uniform(9);
    
    UIButton *iconBtn = (UIButton *)[rowView viewWithTag:1];
    NSString *iconName = [NSString stringWithFormat:@"01%d.png", randomIndex];
    [iconBtn setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [iconBtn addTarget:self action:@selector(iconClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 4, 设置姓名
    UILabel *nameLabel = (UILabel *)[rowView viewWithTag:2];
    nameLabel.text = [NSString stringWithFormat:@"xib: %d", randomIndex];
    
    // 5, 监听删除按钮
    // 可以使用下面两行代码; 或者将 xib 中的按钮连接到 ViewController; // 两种都不建议, 建议方法应该是封装代码
    UIButton *deleteBtn = (UIButton *)[rowView viewWithTag:3];
    [deleteBtn addTarget:self action:@selector(deleteClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return rowView;
}



// *******************************
// 020606
// *******************************
- (UIView *)createRowViewWithCode {
    // 1, 创建控件
    UIView *rowView = [[UIView alloc] init];
    rowView.backgroundColor = [UIColor magentaColor];
    
    
    // 2, 添加头像
    UIButton *iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    iconBtn.frame = CGRectMake(20, 0, kIconWidth, kRowHeight);
    
    // 产生随机文件名
//    int randomIndex = arc4random() % 9;
    int randomIndex = arc4random_uniform(9); // 和上面一行等价
    NSString *iconName = [NSString stringWithFormat:@"01%d.png", randomIndex];
    
    [iconBtn setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    
    // 添加监听器
    [iconBtn addTarget:self action:@selector(iconClick:) forControlEvents:UIControlEventTouchUpInside];
    
    iconBtn.tag = 1;
    [rowView addSubview:iconBtn];
    
    // 3, 添加名字 (标签)
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(0, 0, self.view.frame.size.width, kRowHeight);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = [NSString stringWithFormat:@"%d", randomIndex];
    
    nameLabel.tag = 2;
    [rowView addSubview:nameLabel];
    
    // 020610
    // 4, 每行的删除按钮
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    deleteBtn.frame = CGRectMake(285, 0, kRowHeight, kRowHeight);
    [deleteBtn setTitle:@"delete" forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [rowView addSubview:deleteBtn];
    
    return rowView;
}

// 每一行的 delete
-(void)deleteClick:(UIButton *)btn {
    NSLog(@"");
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = btn.superview.frame;
        rect.origin.x = self.view.frame.size.width;
        btn.superview.frame = rect;
        btn.superview.alpha = 0;
    } completion:^(BOOL finished) {
        // 1, 即将删除的这行在数组中的位置
        long startIndex = [self.view.subviews indexOfObject:btn.superview];
        [btn.superview removeFromSuperview]; // 2, 删除当前行
        _removeItem.enabled = self.view.subviews.count != 1; // 4, 是否仅剩 UIToolBar
        
        [UIView animateWithDuration:0.35 animations:^{
            // 3, 遍历后面的子控件
            for (long i = startIndex; i < self.view.subviews.count; i++) {
                UIView *child = self.view.subviews[i];
                CGRect rect = child.frame;
                rect.origin.y -= kRowHeight + kRowDivider;
                
                child.frame = rect;
            }
        } completion:^(BOOL finished) {
            _removeItem.enabled = self.view.subviews.count != 1; // 4, 是否仅剩 UIToolBar
        }];
        
    }];
    
}

// 020608
- (void)iconClick:(UIButton *)icon {
    UIButton *iconInfo = [icon.superview viewWithTag:1];
    UILabel *label = [icon.superview viewWithTag:2];
    UIButton *deleteBtn = [icon.superview viewWithTag:3];
    
    NSLog(@"%@, %@, %@", iconInfo, label.text, deleteBtn);
}


- (IBAction)remove:(UIBarButtonItem *)sender {
    NSLog(@"");
    UIView *last = [self.view.subviews lastObject];
    if ([last isKindOfClass:UIToolbar.class]) {
        NSLog(@"===========================");
        return;
    }
    
//    if([lastisKindOfClass:[UIToolbar class]]) return; //
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = last.frame;
        rect.origin.x = self.view.frame.size.width;
        last.frame = rect;
        last.alpha = 0;
    } completion:^(BOOL finished) {
        [last removeFromSuperview]; // 移除控件
        _removeItem.enabled = self.view.subviews.count != 1; // 是否仅剩 UIToolBar
    }];
    
//    if(self.view.subviews.count == 1) {
//        _removeItem.enabled = NO;
//    }
    
}

@end




