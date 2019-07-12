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

#import "../../../../PreHeader.h"

#define kImgWidth 51
#define kImgHeight 51

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    int screenW = self.view.frame.size.width;
    int screenH = self.view.frame.size.height;
    
    _imageLayout.frame = CGRectMake(0, 0, screenW, screenH - _segmented.frame.size.height - 20);
    
    
    CGRect frame = CGRectMake(10, screenH - _segmented.frame.size.height - 10, screenW - 20, _segmented.frame.size.height);
    _segmented.frame = frame;
    
    [self adjustImagePositionWithColumns:3 add:YES];
}


- (IBAction)indexChange:(UISegmentedControl *)sender {
//    NSLog(@"selectedSegmentIndex: %ld", sender.selectedSegmentIndex);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    [self adjustImagePositionWithColumns:(sender.selectedSegmentIndex + 3) add:NO];
    
    [UIView commitAnimations];
    
}

// 1, 去掉第二个参数
// 2, 在表情最后面添加一个 + 按钮, 点击按钮在尾部添加一个表情(表情图片随机)
- (void)adjustImagePositionWithColumns:(long)columns add:(BOOL)add{
    CGFloat margin = (self.view.frame.size.width - columns * kImgWidth) / (columns + 1);

    
    for (int i = 0; i < 9; i++) {
        int col = i % columns; // i这个位置对应的列数
        int row = i / columns; //
        
        CGFloat x = margin + col * (kImgWidth + margin);
        CGFloat y = margin + row * (kImgWidth + margin);
        
        if(add) {
            NSString *imgName = [NSString stringWithFormat:@"%d.png", i];
            [self addImg:imgName x:x y:y];
        } else {
            //        [self addImg:imgName x:x y:y];
            UIView *child = _imageLayout.subviews[i];
            
            CGRect rect = child.frame;
            rect.origin = CGPointMake(x, y);
            child.frame = rect;
        }
    }
}


- (void)addImg:(NSString *)icon x:(CGFloat)x y:(CGFloat)y {
    UIImageView *iv = [[UIImageView alloc] init];
    iv.image = [UIImage imageNamed:icon];
    iv.frame = CGRectMake(x, y, kImgWidth, kImgHeight);
    [_imageLayout addSubview:iv];
}

@end



