//
//  HomeVc.m
//  QQZone
//
//  Created by Apple on 2020/6/8.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "HomeVc.h"

#import "Const.h"
#import "DockView.h"
#import "BottomMenuView.h"
#import "TabBarView.h"
#import "IconBtn.h"

#import "MoodVc.h"

// category
#import "UIView+X.h"

@interface HomeVc () <BottomMenuDelegate, TabBarViewDelegate>

@property (nonatomic, strong) DockView *dockView;
@property (nonatomic, weak) UIView *selectedVcView;
@property (nonatomic, assign) BOOL isLandscape;

@property (nonatomic, assign) DockItemType toType;

@end



@implementation HomeVc

- (void)viewDidAppear:(BOOL)animated {
//    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
}

- (void)viewWillAppear:(BOOL)animated {
//    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    
    self.isLandscape = self.view.xWidth > self.view.xHeight;
    [self.dockView rotate:self.isLandscape];
    
    // 默认选中
    [self.dockView.tabBarView clickItem:self.dockView.tabBarView.subviews[0]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    
    self.view.backgroundColor = CommonBgColor;
    
    //
    [self setupDockView];
    
    //
    [self setupChildVcWithTitle:@"Personal Center" andBackgroundColor:[UIColor yellowColor]];
    
    //
    [self setupChildVcWithTitle:@"Moments" andBackgroundColor:[UIColor cyanColor]];
    [self setupChildVcWithTitle:@"Passive" andBackgroundColor:[UIColor magentaColor]];
    [self setupChildVcWithTitle:@"Pic" andBackgroundColor:[UIColor lightGrayColor]];
    [self setupChildVcWithTitle:@"EAlbum" andBackgroundColor:[UIColor blueColor]];
    [self setupChildVcWithTitle:@"Friend" andBackgroundColor:[UIColor orangeColor]];
    [self setupChildVcWithTitle:@"More" andBackgroundColor:[UIColor purpleColor]];
}

- (void)setupChildVcWithTitle:(NSString *)title andBackgroundColor:(UIColor *)color {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = color;
    vc.navigationItem.title = title;
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navVc];
}

- (void)setupDockView {
    // 1
    DockView *dockView = [[DockView alloc] init];
    self.dockView = dockView;
    
    // 2
    dockView.autoresizingMask = UIViewAutoresizingFlexibleHeight; // 跟随父控件
//    dockView.backgroundColor = [UIColor magentaColor];
    dockView.xHeight = self.view.xHeight;
    
    // 3
    dockView.bottomMenuView.bottomMenuDelegate = self;
    
    // 4
    dockView.tabBarView.tabBarViewDelegate = self;
    
    // 5
    [dockView.iconBtn addTarget:self action:@selector(clickIconBtn:) forControlEvents:UIControlEventTouchUpInside];
    
//    BOOL isLandscape = self.view.xWidth > self.view.xHeight;
//    [dockView rotate:isLandscape];
    [self.view addSubview:dockView];
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    self.isLandscape = size.width > size.height;
    [UIView animateWithDuration:coordinator.transitionDuration animations:^{
        [self.dockView rotate:self.isLandscape];
        self.selectedVcView.xX = self.dockView.xWidth;
        self.selectedVcView.xWidth = size.width - self.dockView.xWidth;
    }];
    
    //    NSLog(@"%@; %@", NSStringFromCGSize(size), self.dockView);
}


#pragma mark - BottomMenuDelegate
- (void)bottomMenuView:(BottomMenuView *)bottomMenuView didClickBottomMenuType:(BottomMenuType)bottomMenuType {
//    NSLog(@"%d", bottomMenuType);
    
    switch (bottomMenuType) {
        case BottomMenuMood:
        {
            NSLog(@"%d", bottomMenuType);
            
            MoodVc *moodVc = [[MoodVc alloc] init];
            UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:moodVc];
            // 1, 呈现样式
//            navVc.modalPresentationStyle = UIModalPresentationFullScreen;
//            navVc.modalPresentationStyle = UIModalPresentationFormSheet;
//            navVc.modalPresentationStyle = UIModalPresentationAutomatic;
//            navVc.modalPresentationStyle = UIModalPresentationCurrentContext;
            
            // 2, 过渡样式
//            navVc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal; // 三位翻转
//            navVc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
            
            [self presentViewController:navVc animated:YES completion:nil];
        }
            break;
            
        case BottomMenuPhoto:
            NSLog(@"%d", bottomMenuType);
            break;
            
        case BottomMenuBlog:
            NSLog(@"%d", bottomMenuType);
            break;
            
        default:
            break;
    }
}


#pragma mark -  TabBarViewDelegate
- (void)tabBarBtn:(TabBarBtn *)tabBarBtn didClickFrom:(DockItemType)fromType toType:(DockItemType)toType {
    NSLog(@"from: %d; to: %d", fromType, toType);
    
    // 1
    UIViewController *previousVc = self.childViewControllers[fromType];
    [previousVc.view removeFromSuperview];
    
    // 2
    UIViewController *nextVc = self.childViewControllers[toType];
    self.selectedVcView = nextVc.view;
    nextVc.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:nextVc.view];
    
    // 3
    nextVc.view.xHeight = self.view.xHeight - kStatusBarH;
    nextVc.view.xX = self.dockView.xWidth;
    nextVc.view.xY = kStatusBarH;
    
    nextVc.view.xWidth = self.isLandscape ? self.view.xWidth - kDockLandscapeW : self.view.xWidth - kDockPortraintW;
    
    // 4
    self.toType = toType;
    
}


#pragma mark - Click Listener
- (void)clickIconBtn:(IconBtn *)btn {
    [self.dockView.tabBarView unselectAllType];
    [self tabBarBtn:nil didClickFrom:self.toType toType:TypeIconBtn];
}

@end


