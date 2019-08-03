//
//  ViewController.m
//  ios_020502
//
//  Created by Apple on 2017/7/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "../../../../PreHeader.h"

@interface ViewController () {
    NSDictionary *_dict;
}

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    _tom.frame = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    _tom.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tom" ofType:@"plist"]; // 1, 获得全路径
    _dict = [NSDictionary dictionaryWithContentsOfFile:path]; // 2, 根据文件路径加载字典
    //    NSLog(@"_dict = %@", _dict);
}

- (void)playAnim:(int)count fileName:(NSString *)fileName{
    NSMutableArray *imgArray = [NSMutableArray array]; // 1, 创建可变数组
    
    // 2, 添加图片
    for (int i = 0; i < count; i++) {
        NSString *name = [NSString stringWithFormat:@"%@_%02d.jpg", fileName, i];
        
        // 方法一: 加载图片, 有缓存, 系统控制, 经常使用
//        UIImage *img = [UIImage imageNamed:name];
        
        // 方法二: 全路径, 无缓存
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        
        [imgArray addObject:img];
    }
    
    _tom.animationImages = imgArray; // 3, 设置动画图片
    _tom.animationRepeatCount = 1; // 4, 播放次数
    _tom.animationDuration = 0.1 * count; // 5, 设置动画时间
    [_tom startAnimating]; // 6, 开始动画
}

- (IBAction)btnClick:(UIButton *)sender {
    if(_tom.isAnimating) {
        return;
    }
    
    NSString *title = [sender titleForState:UIControlStateNormal]; // 3, 取按钮文字
//    NSLog(@"title : %@", title);
    
    int count = [_dict[title] intValue]; // 4, 图片数量
    [self playAnim:count fileName:title];
}

@end





