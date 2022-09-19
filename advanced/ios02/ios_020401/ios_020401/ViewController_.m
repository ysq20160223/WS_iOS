//
//  ViewController_.m
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

#import "ViewController_.h"

#import "UIView+X.h"

#define kImgW 66


@interface ViewController_ () {
}

@property (nonatomic, assign) int imageCount;

@end



@implementation ViewController_

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = XColor(0x66, 0x66, 0x66);
    self.imageCount = 9;
    _segmented.frame = CGRectMake(0, kScreenH - 3 * _segmented.xHeight, kScreenW, _segmented.xHeight);
    
//    for (int i = 0; i < self.view.subviews.count; i++) {
//        NSLog(@"%d; %@", i, self.view.subviews[i]);
//    }
    
    [self adjustImagePositionWithColumns:[_segmented titleForSegmentAtIndex:_segmented.selectedSegmentIndex].intValue];
    
}


- (IBAction)indexChange:(UISegmentedControl *)sender {
    [UIView animateWithDuration:1 animations:^{
        [self adjustImagePositionWithColumns:[_segmented titleForSegmentAtIndex:_segmented.selectedSegmentIndex].intValue];
    }];
}


// 无需传递 add 参数
- (void)adjustImagePositionWithColumns:(long)columns {
    CGFloat margin = (kScreenW - columns * kImgW) / (columns + 1); // 每个表情的间距

    for (int i = 0; i < self.imageCount + 1; i++) {
        int col = i % columns; // i这个位置对应的列数
        int row = i / columns;
        
        CGFloat x = margin + col * (kImgW + margin);
        CGFloat y = margin + row * (kImgW + margin) + kStatusBarH;
//        NSLog("%d; %.0f; %.0f; %ld", i, x, y, self.view.subviews.count);
        
        if(self.view.subviews.count < (self.imageCount + 3 + 1)) {
            [self addImg:[NSString stringWithFormat:@"%d.png", i % 9] x:x y:y index:i];
        } else {
            UIView *vChild = self.view.subviews[i + 3];
//            NSLog(@"%d; %@", i, vChild);
            if ([vChild isKindOfClass:UISegmentedControl.class]
                || [vChild isKindOfClass:UILayoutGuide.class]) {
                continue;
            }
            
            CGRect rect = vChild.frame;
            rect.origin = CGPointMake(x, y);
            vChild.frame = rect;
        }
    }
}


- (void)addImg:(NSString *)imgName x:(CGFloat)x y:(CGFloat)y index:(int)index {
    NSLog(@"%@; %d", imgName, index);
    if (index == self.imageCount) {
        UIButton *btnAdd = [UIButton buttonWithType:UIButtonTypeContactAdd];
        btnAdd.adjustsImageWhenHighlighted = NO;
        btnAdd.tag = index;
        [btnAdd addTarget:self action:@selector(imgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btnAdd.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        btnAdd.frame = CGRectMake(x, y, kImgW, kImgW);
        [self.view addSubview:btnAdd];
    } else {
        UIButton *btn = UIButton.alloc.init;
        btn.adjustsImageWhenHighlighted = NO;
        btn.tag = index;
        [btn addTarget:self action:@selector(imgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1];
        btn.frame = CGRectMake(x, y, kImgW, kImgW);
        [self.view addSubview:btn];
    }
    
}

- (void)imgBtnClick:(UIButton *)btn {
    NSLog(@"index: %ld; %@", btn.tag, btn);
    self.imageCount++;
    
}

@end


