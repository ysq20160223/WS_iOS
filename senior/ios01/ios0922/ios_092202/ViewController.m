//
//  ViewController.m
//  ios_092202
//
//  Created by Apple on 2017/8/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

typedef void (^MyBlock)();



@interface ViewController ()

// block 使用 strong, 才能保证不被销毁
@property (nonatomic, strong) MyBlock block;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int i = 1;
    // ARC中, 默认一个局部变量都是强指针
    // 如果 block 中没有使用外部变量, 默认就是全局
    // 如果 block 中使用了外部变量, 就是堆
    void(^myBlock)() = ^() {
        NSLog(@"call myBlock: %d", i);
    };
    
    NSLog(@"%@", myBlock);
    
    _block = myBlock;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (_block) {
        _block();
    }
    
}

@end


