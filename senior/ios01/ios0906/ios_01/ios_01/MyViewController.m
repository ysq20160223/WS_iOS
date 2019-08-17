//
//  VCViewController.m
//  ios_01
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

// 覆盖 loadView 系统就不会加载任何 xib
//- (void)loadView {
//    NSLog(@"");
//    [super loadView];
//}

- (instancetype)init {
    NSLog(@"");
    return [super init];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"");
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}



- (void)viewDidLoad {
    [super viewDidLoad]; // 调用系统的默认做法
    // Do any additional setup after loading the view.
    
    // view: <UIView: 0x7fcdc2301bb0; frame = (0 0; 414 736); autoresize = W+H; layer = <CALayer: 0x618000028500>>
    // view: <UIView: 0x7fc44b8091d0; frame = (0 0; 375 667); autoresize = RM+BM; layer = <CALayer: 0x60800002e480>>
    NSLog(@"view: %@", self.view);
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
