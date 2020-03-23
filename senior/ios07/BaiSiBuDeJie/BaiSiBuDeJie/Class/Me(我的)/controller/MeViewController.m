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

@interface MeViewController ()

@end



@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNaviationBar];
    
}

- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
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
            
        default:
            break;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
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
            
        default:
            break;
    }
}

@end


