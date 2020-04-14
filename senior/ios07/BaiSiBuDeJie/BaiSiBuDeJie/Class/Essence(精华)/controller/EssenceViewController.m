//
//  EssenceNavController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/17.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "EssenceViewController.h"
#import "UIBarButtonItem+X.h"
#import "RecommendViewController.h"

#import "UIView+X.h"
#import "BSConst.h"

#import "AllViewController.h"
#import "VideoViewController.h"
#import "AudioViewController.h"
#import "PicViewController.h"
#import "WordViewController.h"


@interface EssenceViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, weak) UIButton *selectedTitleBtn;
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end



@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XLog
    self.view.backgroundColor = BSCommonBgColor;
    
    [self setupChildViewController];
    
    [self setupScrollView];
    
    [self setupNav];
    
    [self setupTitleView];
    
    
}

#pragma mark -
- (void)setupChildViewController {
    [self addChildViewController:[[AllViewController alloc] init]];
    [self addChildViewController:[[VideoViewController alloc] init]];
    [self addChildViewController:[[AudioViewController alloc] init]];
    [self addChildViewController:[[PicViewController alloc] init]];
    [self addChildViewController:[[WordViewController alloc] init]];
}


#pragma mark -
- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    //
    NSInteger childVcCount = self.childViewControllers.count;
    scrollView.contentSize = CGSizeMake(childVcCount * scrollView.xWidth, 0);
    
    //
    [self addChildVcView];
}

- (void)addChildVcView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSInteger index = self.scrollView.contentOffset.x / self.view.xWidth;
    
    UIViewController *childVc = (UIViewController *)self.childViewControllers[index];
    if (childVc.view.superview) {
        return;
    }
    
    childVc.view.xX = self.scrollView.contentOffset.x;
    childVc.view.xHeight = self.scrollView.xHeight;
    //    childVc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVc.view];
    
    XLog
}

#pragma mark - UIScrollViewDelegate start
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //    XLog
    NSInteger index = scrollView.contentOffset.x / self.view.xWidth;
    [self titleBtnClick:self.titleView.subviews[index]];
    [self addChildVcView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    //    XLog
    [self addChildVcView];
}
#pragma mark - UIScrollViewDelegate end


#pragma mark -
- (void)setupTitleView {
    int y = kStatusBarH + self.navigationController.navigationBar.xHeight;
    //    NSLog(@"y: %d", y);
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, y, self.view.xWidth, kTitleViewH)];
    titleView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.9];
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
    
    NSArray *titleArray = @[@"ALL", @"VIDEO", @"AUDIO", @"PIC", @"WORD"];
    CGFloat titleBtnW = self.view.xWidth / titleArray.count;
    CGFloat titleBtnH = titleView.xHeight;
    for (int i = 0; i < titleArray.count; i++) {
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //        titleBtn.backgroundColor = XRandomColor();
        //        titleBtn.titleLabel.backgroundColor = XRandomColor();
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [titleBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleBtn setTitleColor:BSMainColor forState:UIControlStateHighlighted];
        [titleBtn setTitleColor:BSMainColor forState:UIControlStateSelected];
        titleBtn.tag = i;
        titleBtn.frame = CGRectMake(i * titleBtnW, 0, titleBtnW, titleBtnH);
        [titleView addSubview:titleBtn];
        
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIButton *firstBtn = titleView.subviews[0];
    [firstBtn.titleLabel sizeToFit];
    
    self.indicatorView = [[UIView alloc] init];
    self.indicatorView.xHeight = 1;
    self.indicatorView.xY = titleView.xHeight - self.indicatorView.xHeight;
    self.indicatorView.xWidth = firstBtn.titleLabel.xWidth;
    self.indicatorView.xCenterX = firstBtn.xCenterX;
    self.indicatorView.backgroundColor = BSMainColor;
    [titleView addSubview:self.indicatorView];
    
    [self titleBtnClick:firstBtn];
}

- (void)titleBtnClick:(UIButton *)btn {
    //    NSLog(@"%@", [btn titleForState:UIControlStateNormal]);
    self.selectedTitleBtn.selected = NO;
    btn.selected = YES;
    self.selectedTitleBtn = btn;
    
    // indicatorView
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.xWidth = btn.titleLabel.xWidth;
        self.indicatorView.xCenterX = btn.xCenterX;
    }];
    
    //
    CGPoint point = self.scrollView.contentOffset;
    point.x = self.view.xWidth * btn.tag;
    [self.scrollView setContentOffset:point animated:YES];
}

#pragma mark -
- (void)setupNav {
    //    self.navigationItem.title = @"essence";
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick" tartget:self action:@selector(navItemLeftBtnViewClick:)];
}

- (void)navItemLeftBtnViewClick:(UIButton *)btn {
    //    NSLog(@"btn: %@", btn);
    
    RecommendViewController *viewController = [[RecommendViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end


