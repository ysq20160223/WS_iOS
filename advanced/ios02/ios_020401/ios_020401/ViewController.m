//
//  ViewController.m
//  ios_020401
//
//  Created by Apple on 2017/7/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    扩展
        1, adjustImagePositionWithColumns: add: (不用add)
        2, 在图片后面加一个按钮, 按一次添加一张图片
 */

#import "ViewController.h"

#define kImgW 66


@interface ViewController () {
    int _screenW, _screenH;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _screenW = self.view.frame.size.width;
    _screenH = self.view.frame.size.height;
    
    _segmented.frame = CGRectMake(0, _screenH - 3 * _segmented.frame.size.height, _screenW, _segmented.frame.size.height);
//    NSLog(@"selectedSegmentIndex: %ld", _segmented.selectedSegmentIndex);
    
    [self adjustImagePositionWithColumns:_segmented.selectedSegmentIndex + 3 add:YES];
}


- (IBAction)indexChange:(UISegmentedControl *)sender {
    NSLog(@"selectedSegmentIndex: %ld", sender.selectedSegmentIndex);
    
    [UIView animateWithDuration:1 animations:^{
        [self adjustImagePositionWithColumns:(sender.selectedSegmentIndex + 3) add:NO];
    }];
}


- (void)adjustImagePositionWithColumns:(long)columns add:(BOOL)add{
    CGFloat margin = (_screenW - columns * kImgW) / (columns + 1); // 每个表情的间距

    for (int i = 0; i < 9; i++) {
        int col = i % columns; // i这个位置对应的列数
        int row = i / columns;
        
        CGFloat x = margin + col * (kImgW + margin);
        CGFloat y = margin + row * (kImgW + margin) + UIApplication.sharedApplication.statusBarFrame.size.height;
        
        if(add) {
            NSString *imgName = [NSString stringWithFormat:@"%d.png", i % 9]; // 9张图片
            [self addImg:imgName x:x y:y index:i];
        } else {
            UIView *child = self.view.subviews[i + 1];
            
            CGRect rect = child.frame;
            rect.origin = CGPointMake(x, y);
            child.frame = rect;
        }
    }
//    NSLog(@"subviews: %@", self.view.subviews);
}


- (void)addImg:(NSString *)imgName x:(CGFloat)x y:(CGFloat)y index:(int)index {
    //
//    UIImageView *iv = [[UIImageView alloc] init];
//    iv.image = [UIImage imageNamed:icon];
//    iv.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1];
//    iv.frame = CGRectMake(x, y, kImgW, kImgW);
//    [self.view addSubview:iv];
    
    //
    UIButton *btn = UIButton.alloc.init;
    btn.adjustsImageWhenHighlighted = NO;
    btn.tag = index;
    [btn addTarget:self action:@selector(imgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1];
    btn.frame = CGRectMake(x, y, kImgW, kImgW);
    [self.view addSubview:btn];
}

- (void)imgBtnClick:(UIButton *)btn {
    NSLog(@"index: %ld; %@", btn.tag, btn);
}

@end


