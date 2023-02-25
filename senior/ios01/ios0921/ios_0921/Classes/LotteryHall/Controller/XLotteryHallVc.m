//
//  XLotteryHallVc.m
//  ios_0921
//
//  Created by Apple on 2017/8/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XLotteryHallVc.h"

#import "UIImage+X.h"

#import "XCover.h"
#import "XPopMenu.h"

//typedef <#returnType#>(^<#name#>)(<#arguments#>);

@interface XLotteryHallVc () <XPopMenuDelegate> {
    NSInteger _screenW;
    NSInteger _screenH;
}

@end



@implementation XLotteryHallVc

//- (void)loadView {
//    // 自己创建控制器的 view
//    UIImageView *imageView = [UIImageView.alloc initWithFrame:UIScreen.mainScreen.bounds];
//    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
////    imageView.image = [UIImage imageWithColor:UIColor.cyanColor];
//    imageView.userInteractionEnabled = YES;
//    
//    self.view = imageView;
//}

- (void)setNavBar {
    UISegmentedControl *segment = [UISegmentedControl.alloc initWithItems:@[@"FootBall", @"BasketBall"]];
    segment.selectedSegmentIndex = 0;
    
    UIColor *tintColor = [UIColor colorWithDisplayP3Red:(65 / 255.0) green:(165 / 255.0) blue:(169 / 255.0) alpha:1];
//    segment.tintColor = tintColor;
    
    // 设置选中的背景图片
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 设置文字
    NSMutableDictionary *normalAttr = NSMutableDictionary.dictionary;
    normalAttr[NSForegroundColorAttributeName] = tintColor;
    [segment setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttr = NSMutableDictionary.dictionary;
    selectedAttr[NSForegroundColorAttributeName] = UIColor.whiteColor;
    [segment setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
    self.navigationItem.titleView = segment; // 设置导航条的内容
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavBar];
    
    _screenW = UIScreen.mainScreen.bounds.size.width;
    _screenH = UIScreen.mainScreen.bounds.size.height;
    
//    self.view.backgroundColor = [UIColor colorWithDisplayP3Red:1 green:0 blue:1 alpha:1];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithImage:[UIImage xImageWithOriginalImageNamed:@"CS50_activity_image"] style:0 target:self action:@selector(activity)];
    
    // 测试左右 BarButtonItem
//    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithImage:[UIImage imageWithOriginalImageNamed:@"CPArenaSegmentSelectedBG"] style:0 target:self action:@selector(activity)];
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem.alloc initWithImage:[UIImage imageWithOriginalImageNamed:@"CPArenaSegmentSelectedBG"] style:0 target:self action:@selector(activity)];
}

- (void)activity {
//    NSLog(@"");
    // 1, 弹出蒙版, 蒙版上有 pop
    [XCover show];
    
    // 2,
    XPopMenu *popMenu = [XPopMenu showInPoint:CGPointMake(_screenW * .5, _screenH * .5)];
    popMenu.delegate = self;
}

#pragma mark - XPopMenuDelegate start
- (void)popMenuDidClickClose:(XPopMenu *)popMenu {
//    [popMenu hideInPoint:CGPointMake(24, 44)];
//    [XCover hide];
    
    
//    <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
//        <#statements#>
//    };
    void (^popMenuHide)() = ^{
        [XCover hide];
    };
    
    [popMenu hideInPoint:CGPointMake(44, kStatusBarH + self.navigationController.navigationBar.frame.size.height / 2) completion:popMenuHide];
//    [popMenu hideInPoint:CGPointMake(44, kStatusBarH + self.navigationController.navigationBar.frame.size.height / 2) completion:^{
//
//    }];
}
#pragma mark - XPopMenuDelegate end


#pragma mark - Table view data source start
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
//    NSLog(@"cell: %@", cell);
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
//    NSLog(@"cell: %@", cell);
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    return cell;
}
#pragma mark - Table view data source end


@end


