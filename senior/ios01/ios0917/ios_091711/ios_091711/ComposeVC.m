//
//  ComposeVC.m
//  ios_091711
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ComposeVC.h"
#import "MenuBean.h"
#import "MenuBtn.h"

@interface ComposeVC ()

@property (nonatomic, strong) NSMutableArray *menuBtnArray;

@property (nonatomic, assign) int btnIndex;

@property (nonatomic, strong) NSTimer *timer;

@end



@implementation ComposeVC

- (NSMutableArray *)menuBtnArray {
    if (!_menuBtnArray) {
        _menuBtnArray = NSMutableArray.array;
    }
    return _menuBtnArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addBtn];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

- (void)update {
    if (self.btnIndex == self.menuBtnArray.count) {
        [self.timer invalidate];
        return;
    }
    
    UIButton *btn = self.menuBtnArray[self.btnIndex];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        btn.transform = CGAffineTransformIdentity;
    } completion:nil];
    
    self.btnIndex++;
}

//- (void)viewDidAppear:(BOOL)animated {
//    for (UIButton *btn in self.btnArray) {
//        [UIView animateWithDuration:1 animations:^{
//            btn.transform = CGAffineTransformIdentity;
//        }];
//    }
//}

- (void)addBtn {
    CGFloat btnWhH = 100;
    int column = 3;
    
    CGFloat margin = (UIScreen.mainScreen.bounds.size.width - column * btnWhH) / (column + 1);
    CGFloat x = 0;
    CGFloat y = 0;
    int curColumn = 0;
    int curRow = 0;
    CGFloat oriY = 300;
    
    for (int i = 0; i < self.menuBeanArray.count; i++) {
        MenuBtn *btn = [MenuBtn buttonWithType:UIButtonTypeCustom];
        
        curColumn = i % column;
        curRow = i / column;
        
        x = margin + (btnWhH + margin) * curColumn;
        y = (btnWhH + margin) * curRow + oriY;
        
        btn.frame = CGRectMake(x, y, btnWhH, btnWhH);
        [btn setBackgroundColor:UIColor.cyanColor];
        
        MenuBean *item = self.menuBeanArray[i];
        [btn setImage:item.image forState:UIControlStateNormal];
        [btn setTitle:item.title forState:UIControlStateNormal];
        
        [self.view addSubview:btn];
        
        //
        btn.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
        
        [self.menuBtnArray addObject:btn];
        
        // 监听点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(btnClickUp:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

//
- (void)btnClick:(UIButton *)btn {
    [UIView animateWithDuration:.5 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
}

//
- (void)btnClickUp:(UIButton *)btn {
    [UIView animateWithDuration:1 animations:^{
        btn.alpha = 0;
        btn.transform = CGAffineTransformMakeScale(2, 2);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


