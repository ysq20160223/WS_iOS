//
//  ViewController.m
//  ios_020502
//
//  Created by Apple on 2017/7/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "UIView+X.h"

@interface ViewController () {
    NSDictionary *_imgNameAndNumberDict;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    _imgView.frame = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    _imgView.frame = CGRectMake(0, 0, self.view.xWidth, self.view.xHeight);
    
    NSString *path = [NSBundle.mainBundle pathForResource:@"tom" ofType:@"plist"]; // 1, 获得全路径
    _imgNameAndNumberDict = [NSDictionary dictionaryWithContentsOfFile:path]; // 2, 根据文件路径加载字典
//    NSLog(@"_imgNameAndNumberDict: %@", _imgNameAndNumberDict);
}

- (void)playAnim:(int)count fileName:(NSString *)fileName{
    NSMutableArray *imgArray = [NSMutableArray array];
    
    // 2, 添加图片
    for (int i = 0; i < count; i++) {
        NSString *name = [NSString stringWithFormat:@"%@_%02d.jpg", fileName, i];
        
        // 方法一: 加载图片, 有缓存, 系统控制, 经常使用
//        UIImage *img = [UIImage imageNamed:name];
        
        // 方法二: 全路径, 无缓存
        NSString *path = [NSBundle.mainBundle pathForResource:name ofType:nil];
//        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        UIImage *img = [UIImage imageWithContentsOfFile:path];

        //
        [imgArray addObject:img];
    }
    //
//    NSString *name = [NSString stringWithFormat:@"%@_00.jpg", fileName];
//    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil]; // 全路径
//    NSLog(@"name: %@, path: %@", name, path);
    //
    
    _imgView.animationImages = imgArray; // 3, 设置动画图片
    _imgView.animationRepeatCount = 1; // 4, 播放次数
    _imgView.animationDuration = 0.1 * count; // 5, 设置动画时间
    [_imgView startAnimating]; // 6, 开始动画
}

- (IBAction)btnClick:(UIButton *)sender {
    if(_imgView.isAnimating) {
        return;
    }
    
    NSString *title = [sender titleForState:UIControlStateNormal]; // 取按钮文字
//    NSLog(@"title : %@", title);
    
    int count = [_imgNameAndNumberDict[title] intValue]; // 图片数量
    [self playAnim:count fileName:title];
}

@end


