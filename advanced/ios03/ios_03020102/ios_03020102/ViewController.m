//
//  ViewController.m
//  ios_03020102
//
//  Created by Apple on 11/01/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>{
    NSArray *_provinceArray;
    NSArray *_footerArray;
    NSArray *_cityArray;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    
    _provinceArray = @[@"福建", @"广东"];
    _footerArray = @[@"fj", @"gd"];
    _cityArray = @[
                   @[@"福州", @"厦门", @"莆田"],
                   @[@"广州", @"深圳", @"惠州"]
                   ];
}


//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _provinceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_cityArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = _cityArray[indexPath.section][indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _provinceArray[section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return _footerArray[section];
}

@end



