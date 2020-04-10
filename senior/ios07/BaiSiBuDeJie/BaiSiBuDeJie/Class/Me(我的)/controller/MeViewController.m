//
//  MeNavController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/17.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "MeViewController.h"
#import "UIBarButtonItem+X.h"

#import "LoginRegisterController.h"
#import "MeTableViewCell.h"
#import "UIView+X.h"
#import "MeFooterView.h"

#import "MeClearCacheCell.h"

@interface MeViewController ()


@end



@implementation MeViewController

static NSString *const BSClearCellId = @"BSClearCellId";
static NSString *const BSSettingCellId = @"BSSettingCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNaviationBar];
    
    [self setupTableView];
    
    MeFooterView *footView = [[MeFooterView alloc] init];
    self.tableView.tableFooterView = footView;

    [self.tableView registerClass:[MeClearCacheCell class] forCellReuseIdentifier:BSClearCellId];
    [self.tableView registerClass:[MeTableViewCell class] forCellReuseIdentifier:BSSettingCellId];
}

- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)setupTableView {
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
}

- (void)setupNaviationBar {
    XLog
    //    self.view.backgroundColor = XColor(0xff, 0x88, 0x00);
    //    self.view.backgroundColor = XColor(0xff, 0xff, 0xff);
    self.navigationItem.title = @"me";
    
    // 设置颜色
    NSDictionary *dic = @{NSForegroundColorAttributeName: [UIColor blackColor]};
    self.navigationController.navigationBar.titleTextAttributes =dic;
    
    
    self.navigationItem.rightBarButtonItems = @[
        [UIBarButtonItem itemWithImage:@"mine-setting-icon" highlightImage:@"mine-setting-icon-click" tartget:self action:@selector(navItemRightSettingBtnClick:)],
        [UIBarButtonItem itemWithImage:@"mine-moon-icon" highlightImage:@"mine-moon-icon-click" tartget:self action:@selector(navItemRightMoonBtnClick:)]
    ];
}

- (void)navItemRightSettingBtnClick:(UIButton *)btn {
    NSLog(@"btn: %@", btn);
    
}

- (void)navItemRightMoonBtnClick:(UIButton *)btn {
    NSLog(@"btn: %@", btn);
    
}

#pragma mark - UITableViewDataSource start
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (2 == indexPath.section) {
        return [tableView dequeueReusableCellWithIdentifier:BSClearCellId];
    } else {
        MeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BSSettingCellId];
//    cell.backgroundColor = [UIColor clearColor];
        
        switch (indexPath.section) {
            case 0:
                cell.textLabel.text = @"Login";
                cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
                break;
                
            case 1:
                cell.textLabel.text = @"Version Check";
                cell.imageView.image = nil;
                break;
        }
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (3 == indexPath.section) {
        return 100;
    } else {
        return 44;
    }
}

#pragma mark - UITableViewDataSource end

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"section: %ld, row: %ld", indexPath.section, indexPath.row);
    
    switch (indexPath.section) {
        case 0:
            [self presentViewController:[[LoginRegisterController alloc] init] animated:YES completion:^{
                //                XLog
                
            }];
            break;
            
        case 1:
            
            break;
            
        default:
            break;
    }
}

@end


