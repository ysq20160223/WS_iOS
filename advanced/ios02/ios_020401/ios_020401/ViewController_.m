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

@property (nonatomic, assign) NSInteger btnCount;
@property (nonatomic, assign) NSInteger otherSubViewCount;

@end



@implementation ViewController_

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XColor(0x66, 0x66, 0x66);
    self.btnCount = 9;
    _segmented.frame = CGRectMake(10, kScreenH - 3 * _segmented.xHeight, kScreenW - 20, _segmented.xHeight);
    
//    for (int i = 0; i < self.view.subviews.count; i++) {
//        NSLog(@"%d; %@", i, self.view.subviews[i]);
//    }
    
    self.otherSubViewCount = self.view.subviews.count;
    
    [self adjustImagePositionWithColumns:[_segmented titleForSegmentAtIndex:_segmented.selectedSegmentIndex].integerValue];
    
}

- (IBAction)indexChange:(UISegmentedControl *)sender {
    [UIView animateWithDuration:1 animations:^{
        [self adjustImagePositionWithColumns:[_segmented titleForSegmentAtIndex:_segmented.selectedSegmentIndex].integerValue];
    }];
}

- (void)adjustImagePositionWithColumns:(long)columns {
    CGFloat margin = (kScreenW - columns * kImgW) / (columns + 1); // 每个表情的间距

    for (NSInteger i = 0; i < self.btnCount + 1; i++) { // + 1 : 添加最后一个 UIButtonTypeContactAdd
        NSInteger col = i % columns; // i这个位置对应的列数
        NSInteger row = i / columns;
        
        CGFloat x = margin + col * (kImgW + margin);
        CGFloat y = margin + row * (kImgW + margin) + kStatusBarH;
//        NSLog("%d; %.0f; %.0f; %ld", i, x, y, self.view.subviews.count);
        
        if(self.view.subviews.count < (self.btnCount + self.otherSubViewCount + 1)) {
            NSInteger index = self.view.subviews.count - self.otherSubViewCount;
            [self addImg:[NSString stringWithFormat:@"%ld.png", index % 9] x:x y:y index:index];
        } else {
            UIView *vChild = self.view.subviews[i + self.otherSubViewCount];
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


- (void)addImg:(NSString *)imgName x:(CGFloat)x y:(CGFloat)y index:(NSInteger)index {
    NSLog(@"%@; %ld; %ld", imgName, index, self.view.subviews.count);
    
    UIButton *btn;
    if (self.view.subviews.count - self.otherSubViewCount == self.btnCount) {
        btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        btn.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    } else {
        btn = UIButton.alloc.init;
        btn.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
        [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    btn.adjustsImageWhenHighlighted = NO;
    btn.tag = index;
    [btn addTarget:self action:@selector(imgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(x, y, kImgW, kImgW);
    [self.view addSubview:btn];
}

- (void)imgBtnClick:(UIButton *)btn {
    NSLog(@"%@; %ld", btn, self.view.subviews.count);
    if (btn.tag == self.view.subviews.count - self.otherSubViewCount - 1) { // 点击 UIButtonTypeContactAdd
        [self.view.subviews.lastObject removeFromSuperview];
        
        self.btnCount++;
        [self indexChange:self.segmented];
    }
}

@end


