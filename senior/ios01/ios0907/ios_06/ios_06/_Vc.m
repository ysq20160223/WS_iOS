//
//  ViewController.m
//  ios_06
//
//  Created by Apple on 2017/7/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "_Vc.h"

#import "UIImage+Image.h"


@interface _Vc () <UITableViewDelegate, UITableViewDataSource> {
    NSInteger _navigationBarH;
    
    NSInteger _headViewH;
    NSInteger _tabViewH;
    NSInteger _headViewMinH;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headHeightConstraint; // 无视觉差调用
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headTopConstraint; // 有视觉差调用

@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIView *tabView;
@property (nonatomic, weak) UILabel *label;

@end



@implementation _Vc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.frame = [UIScreen mainScreen].bounds;
    
    _navigationBarH = self.navigationController.navigationBar.frame.size.height;
    _headViewH = self.headView.frame.size.height;
    _tabViewH = self.tabView.frame.size.height;
    _headViewMinH = _navigationBarH + [[UIApplication sharedApplication] statusBarFrame].size.height;
    NSLog(@"_headViewH: %ld, _navigationBarH: %ld, _headViewMinH: %ld", _headViewH, _navigationBarH, _headViewMinH);
    
    [self setUpNavigation];
    
    // 090706
    // ios7 之后, 苹果自动会给导航控制器里面的所有 UIScrollView 顶部都会添加额外的滚动区域64
    self.automaticallyAdjustsScrollViewInsets = NO; //

    
    self.tableView.contentInset = UIEdgeInsetsMake(_headViewH + _tabViewH, 0, 0, 0); // 调用一次 scrollViewDidScroll:
    NSLog(@"y: %f", self.tableView.contentOffset.y);
}


#pragma mark - UIScrollViewDelegate
// 滚动 tableView 的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollView: %@", scrollView);
    
    // 偏移量: 内容与可视范围的差值; 内容起始点的偏移量为0
    CGFloat curOffsetY = scrollView.contentOffset.y;
    
    // 获取当前滚动偏移量
    CGFloat scrollY = curOffsetY - -(_headViewH + _tabViewH);
    
    
    // 没有视觉差
//    if(scrollY > _headViewH - _headViewMinH) {
//        scrollY = _headViewH - _headViewMinH;
//    }
//    self.headHeightConstraint.constant = -scrollY;
//    NSLog(@"curOffsetY: %f, delta: %f", curOffsetY, scrollY);
    
    // 实现视觉差
    // 修改 HeadView 中 ImageView current mode 为 aspect fill 可以防止图片被压缩
    // 修改 ImageView Drawing 中 Clip to Bounds 为选中状态
    CGFloat deltaY = _headViewH - scrollY;
    if(deltaY < _headViewMinH) {
        deltaY = _headViewMinH;
    }
    self.headTopConstraint.constant = deltaY;
    NSLog(@"curOffsetY: %f, scrollY: %f, deltaY: %f", curOffsetY, scrollY, deltaY);
    
    // 设置透明度
    CGFloat alpha = scrollY / (_headViewH - _headViewMinH);
    if (alpha >= 1) {
        alpha = 0.99;
    }
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:alpha * 0.5]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault]; // 设置导航条背景图片
    
    _label.textColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:alpha];
}


#pragma mark - UITableViewDataSource
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
    cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


// 090707
#pragma mark -
- (void) setUpNavigation {
    
    // UIBarMetricsDefault : 只有设置这种样式, 才能设置导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]]; // 清空导航条的阴影的线
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    // 标题透明
    UILabel *label = [[UILabel alloc] init];
    label.text = @"YY";
    [label sizeToFit]; // 尺寸自适应
    label.textColor = [UIColor colorWithWhite:1 alpha:0];
    [self.navigationItem setTitleView:label];
    
        NSLog(@"%@", [self.navigationItem titleView]);
    _label = label;
}

@end


