//
//  ViewController.m
//  ios_03020108
//
//  Created by Apple on 2017/7/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Province.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray<Province *> *provinceArray;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [UITableView.alloc initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    Province *fj = [Province.alloc init];
    fj.header = @"FJ";
    fj.footer = @"FuJian";
    fj.cities = @[@"FuZhou", @"XiaMen", @"PuTian", @"QuanZhou", @"ZhangZhou", @"NingDe", @"SanMing", @"LongYan", @"NanPing"];
    
    Province *gd = [Province.alloc init];
    gd.header = @"GD";
    gd.footer = @"GuangDong";
    gd.cities = @[@"GuangZhou", @"ShenZhen", @"DongGuan", @"HuiZhou", @"FoShan", @"ZhongShan", @"ChaoShan", @"HeYuan", @"WenZhou"];
    
    Province *zj = [Province provinceWithHeader:@"ZJ" footer:@"ZheJiang" cities:@[@"HangZhou", @"WenZhou", @"NingBo", @"JinHua"]];
    
    self.provinceArray = @[fj, gd, zj];
}


#pragma mark - UITableViewDataSource start
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
//    Province *p = self.provinceArray[indexPath.section];
//    cell.textLabel.text = p.cities[indexPath.row];

    cell.textLabel.text = self.provinceArray[indexPath.section].cities[indexPath.row]; // 与上两行结果一致
    return cell;
}

// 2
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    Province *p = self.provinceArray[section];
//    return p.cities.count;
    
    return self.provinceArray[section].cities.count;
}

// 1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.provinceArray.count;
}

//
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.provinceArray[section].header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.provinceArray[section].footer;
}


// 03-02-01-09 右侧索引条
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *titles = [NSMutableArray array];
    for (Province *p in self.provinceArray) {
        [titles addObject:p.header];
    }
    return titles;
}
#pragma mark UITableViewDataSource end


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end


