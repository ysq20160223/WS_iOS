//
//  ViewController.m
//  ios_06
//
//  Created by Apple on 2017/7/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+Image.h"


#define kHeadViewH 200
#define kHeadViewMinH 64
#define kTabBarH 44

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) CGFloat oriOffsetY;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headTopCons; // Head + Option

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headHeightCons; //

@property (nonatomic, weak) UILabel *label;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self setUpNavigation];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _oriOffsetY = -(kHeadViewH + kTabBarH);
    self.tableView.contentInset = UIEdgeInsetsMake(kHeadViewH + kTabBarH, 0, 0, 0); // 调用一次 scrollViewDidScroll:
    
}

// 滚动 tableView 的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    // 计算下tableView滚动了多少
    
    //
    CGFloat curOffsetY = scrollView.contentOffset.y; // 内容起始点的位置为0
//    NSLog(@"curOffsetY = %f", curOffsetY);
    
    // 获取当前滚动偏移量 - 最开始的偏移量
    CGFloat delta = curOffsetY - _oriOffsetY;
//    NSLog(@"delta = %f", delta);
    
    CGFloat h = kHeadViewH - delta;
    if(h < kHeadViewMinH) {
        h = kHeadViewMinH;
    }
    _headHeightCons.constant = h;
    
    //
    CGFloat alpha = delta / (kHeadViewH - kHeadViewMinH);
    if (alpha > 1) {
        alpha = 0.99;
    }
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault]; // 设置导航条背景图片
    
    _label.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

//
- (void) setUpNavigation {
    // UIBarMetricsDefault : 只有设置这种样式, 才能设置导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]]; // 清空导航条的阴影的线
    
    // 标题透明
    UILabel *label = [[UILabel alloc] init];
    label.text = @"YY";
    [label sizeToFit];
    label.textColor = [UIColor colorWithWhite:1 alpha:0];
    [self.navigationItem setTitleView:label];
    
    _label = label;
}

@end
