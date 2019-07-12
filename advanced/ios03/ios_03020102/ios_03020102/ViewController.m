//
//  ViewController.m
//  ios_03020102
//
//  Created by Apple on 2017/7/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
{
    //    NSArray *_gdCites;
    //    NSArray *_fjCites;
    
    NSArray *_allCites;
    NSArray *_allProvinces;
    NSArray *_china;
}
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
    // 1
    //    _fjCites = @[@"福州", @"厦门", @"莆田", @"泉州", @"漳州"];
    //    _gdCites = @[@"广州", @"深圳"];
    
    // 2
//    _allCites = @[
//                  @[@"福州", @"厦门", @"莆田", @"泉州", @"漳州", @"宁德", @"南平"],
//                  @[@"广州", @"深圳"],
//                  @[@"杭州", @"温州"],
//                  @[@"南京", @"苏州", @"扬州"]
//                  ];
//    
//    _allProvinces = @[@"福建", @"广东", @"浙江", @"江苏"];
    
    
    // 3
    _china = @[
               @{@"header" : @"福建",
                 @"footer" : @"FJ",
                 @"cities" : @[@"福州", @"厦门", @"莆田", @"泉州", @"漳州", @"宁德", @"南平"]},
               
               @{@"header" : @"广东",
                 @"footer" : @"GD",
                 @"cities" : @[@"广州", @"深圳", @"惠州"]},
               
               @{@"header" : @"浙江",
                 @"footer" : @"ZJ",
                 @"cities" : @[@"杭州", @"温州"]},
               
               @{@"header" : @"江苏",
                 @"footer" : @"JS",
                 @"cities" : @[@"南京", @"苏州", @"扬州"]}
               ];
    
    
}

// 1 - 几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //    return _allCites.count;
    return _china.count;
}

// 2 - 每组有几列
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 1
    //    if (section == 0) {
    //        return _fjCites.count;
    //    } else {
    //        return _gdCites.count;
    //    }
    
    // 2
//    return [_allCites[section] count];
    
    // 3
    return [_china[section][@"cities"] count];
}


// 3 - 每行显示数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    // 1
    //    NSString *text = nil;
    //    if(indexPath.section == 0) {
    //        text = _fjCites[indexPath.row];
    //    } else {
    //        text = _gdCites[indexPath.row];
    //    }
    //    cell.textLabel.text = text;
    
    // 2
//    cell.textLabel.text = _allCites[indexPath.section][indexPath.row];
    
    // 3
//    NSDictionary *provinces = _china[indexPath.section];
//    NSArray *cities = provinces[@"cities"];
//    cell.textLabel.text = cities[indexPath.row];
    
    cell.textLabel.text = _china[indexPath.section][@"cities"][indexPath.row];
    return cell;
}


//
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return _allProvinces[section];
    return _china[section][@"header"];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    return @"footer";
    return _china[section][@"footer"];
}

@end



