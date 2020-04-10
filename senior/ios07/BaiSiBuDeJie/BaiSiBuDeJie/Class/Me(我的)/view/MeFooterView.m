//
//  MeFooterView.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/29.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MeFooterView.h"
#import "BSConst.h"
#import "UIView+X.h"
#import "MeFooterSquareModel.h"

#import "AFNetworking.h"

#import "MJExtension.h"
#import "MeFooterSquareBtn.h"

#import "MeFooterWebController.h"

#import "MBProgressHUD.h"

@implementation MeFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor magentaColor];
        
        
        __weak typeof(self) weakSelf = self;
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        [hud showAnimated:YES];
        
        NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
        paraDict[@"a"] = @"square";
        paraDict[@"c"] = @"topic";
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[AFHTTPSessionManager manager] GET:meFooterUrl parameters:paraDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [hud hideAnimated:YES];
                NSArray *squareArray = [MeFooterSquareModel mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
                [weakSelf createSquare:squareArray];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [hud hideAnimated:YES];
                NSLog(@"error: %@", error);
            }];
        });
    }
    return self;
}

- (void)dealloc {
    XLog
}

- (void)createSquare:(NSArray *)array {
    int maxColumn = 4;
    CGFloat btnW = self.xWidth / maxColumn;
    CGFloat btnH = btnW;
    
    for (int i = 0; i < array.count; i++) {
//        NSLog(@"i: %d; %@", i, array[i]);
        id obj = array[i];
        if (NO == [obj isKindOfClass:[MeFooterSquareModel class]]) {
            continue;
        }
        
        MeFooterSquareBtn *btn = [MeFooterSquareBtn buttonWithType:UIButtonTypeCustom];
        btn.xX = (i % maxColumn) * btnW;
        btn.xY = (i / maxColumn) * btnH;
        btn.xWidth = btnW;
        btn.xHeight = btnH;
        
        btn.squareModel = obj;
        
        [btn setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        //
//        btn.backgroundColor = XRandomColorAlpha(0.3);
    }
    
    //
    self.xHeight = self.subviews.lastObject.xBottom;
//    NSLog(@"frame: %@", NSStringFromCGRect(self.frame));
    
    //
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    [tableView reloadData];
//    tableView.contentSize = CGSizeMake(0, self.xBottom);
}

- (void)btnClick:(MeFooterSquareBtn *)btn {
    NSLog(@"%@", btn.squareModel);
    
    MeFooterSquareModel *model = btn.squareModel;
    NSString *url = model.url;
    if ([url hasPrefix:@"http"]) {
        UITabBarController *tabBarVc = (UITabBarController *)self.window.rootViewController;
        UINavigationController *navVc = tabBarVc.selectedViewController;
        
        MeFooterWebController *webVc = [[MeFooterWebController alloc] init];
        webVc.url = url;
        webVc.name = model.name;
        [navVc pushViewController:webVc animated:YES];
    } else if ([url hasPrefix:@"mod"]) {
        
    }
}

@end


