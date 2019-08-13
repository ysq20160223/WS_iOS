//
//  ViewController.m
//  ios_03020108
//
//  Created by Apple on 2017/7/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Province.h"

@interface ViewController () <UITableViewDataSource> {
    NSArray *_provinces;
}
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    Province *fj = [[Province alloc] init];
    fj.header = @"福建";
    fj.footer = @"fj";
    fj.cities = @[@"福州", @"厦门", @"莆田", @"泉州", @"漳州", @"宁德", @"南平", @"三明", @"龙岩"];
    
    Province *gd = [[Province alloc] init];
    gd.header = @"广东";
    gd.footer = @"gd";
    gd.cities = @[@"广州", @"深圳", @"惠州", @"东莞", @"佛山", @"珠海", @"中山", @"梅州"];
    
    Province *zj = [Province provinceWithHeader:@"浙江" footer:@"zj" cities:@[@"杭州", @"温州", @"宁波", @"绍兴", @"金华"]];
    
    _provinces = @[fj, gd, zj];
}


#pragma mark - UITableViewDataSource start
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
//    Province *p = _provinces[indexPath.section];
//    cell.textLabel.text = p.cities[indexPath.row];

    cell.textLabel.text = [_provinces[indexPath.section] cities][indexPath.row]; // 与上两行结果一致
    return cell;
}

// 2
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    Province *p = _provinces[section];
//    return p.cities.count;
    
    return [_provinces[section] cities].count;
}

// 1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _provinces.count;
}

//
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [_provinces[section] header];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [_provinces[section] footer];
}


// 03-02-01-09 右侧索引条
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *titles = [NSMutableArray array];
    for (Province *p in _provinces) {
        [titles addObject:p.header];
    }
    return titles;
}
#pragma mark UITableViewDataSource end


@end





