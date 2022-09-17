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

#import "UIView+X.h"

#define kImgW 66


@interface ViewController () {
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = XColor(0x35, 0x36, 0x37);
    
    _segmented.frame = CGRectMake(0, kScreenH - 3 * _segmented.xHeight, kScreenW, _segmented.xHeight);
    
    [self adjustImagePositionWithColumns:[_segmented titleForSegmentAtIndex:_segmented.selectedSegmentIndex].intValue andIsAdd:YES];
//    [self adjustImagePositionWithColumns:[_segmented titleForSegmentAtIndex:_segmented.selectedSegmentIndex].intValue];
}


- (IBAction)indexChange:(UISegmentedControl *)sender {
//    NSLog(@"%ld; %@", sender.selectedSegmentIndex, [sender titleForSegmentAtIndex:sender.selectedSegmentIndex]);
    
    [UIView animateWithDuration:1 animations:^{
//        [self adjustImagePositionWithColumns:[sender titleForSegmentAtIndex:sender.selectedSegmentIndex].intValue andIsAdd:NO];
        [self adjustImagePositionWithColumns:[_segmented titleForSegmentAtIndex:_segmented.selectedSegmentIndex].intValue];
    }];
}

//
- (void)adjustImagePositionWithColumns:(long)columns andIsAdd:(BOOL)isAdd {
    CGFloat margin = (kScreenW - columns * kImgW) / (columns + 1); // 每个表情的间距

//    NSArray<UIView *> *subviews = self.view.subviews;
//    for (int i = 0; i < subviews.count; i++) {
//        NSLog(@"%d: %@", i, subviews[i]);
//    }
    
    for (int i = 0; i < 9; i++) {
        int col = i % columns; // i这个位置对应的列数
        int row = i / columns;
        
        CGFloat x = margin + col * (kImgW + margin);
        CGFloat y = margin + row * (kImgW + margin) + kStatusBarH;
        
        if(isAdd) {
            [self addImg:[NSString stringWithFormat:@"%d.png", i % 9] x:x y:y index:i];
        } else {
            UIView *vChild = self.view.subviews[i + 1];
            
            CGRect rect = vChild.frame;
            rect.origin = CGPointMake(x, y);
            vChild.frame = rect;
        }
    }
//    NSLog(@"subviews: %@", self.view.subviews);
}

// 无需传递 add 参数
- (void)adjustImagePositionWithColumns:(long)columns {
    CGFloat margin = (kScreenW - columns * kImgW) / (columns + 1); // 每个表情的间距

    for (int i = 0; i < 9; i++) {
        int col = i % columns; // i这个位置对应的列数
        int row = i / columns;
        
        CGFloat x = margin + col * (kImgW + margin);
        CGFloat y = margin + row * (kImgW + margin) + kStatusBarH;
        
        if(self.view.subviews.count < 10) {
            [self addImg:[NSString stringWithFormat:@"%d.png", i % 9] x:x y:y index:i];
        } else {
            UIView *vChild = self.view.subviews[i + 1];
            
            CGRect rect = vChild.frame;
            rect.origin = CGPointMake(x, y);
            vChild.frame = rect;
        }
    }
//    NSLog(@"subviews: %@; count: %ld", self.view.subviews, self.view.subviews.count);
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


