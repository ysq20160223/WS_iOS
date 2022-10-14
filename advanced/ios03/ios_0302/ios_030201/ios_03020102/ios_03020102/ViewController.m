//
//  ViewController.m
//  ios_03020102
//
//  Created by Apple on 11/01/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray<NSString *> *provinceArray;
@property (strong, nonatomic) NSArray<NSArray *> *cityArray;
@property (strong, nonatomic) NSArray<NSString *> *footerArray;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [UITableView.alloc initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    self.provinceArray = @[@"福建", @"广东"];
    self.footerArray = @[@"FJ", @"GD"];
    self.cityArray = @[
                        @[@"福州", @"厦门", @"莆田"],
                        @[@"广州", @"深圳", @"惠州"]
                    ];
}


//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    XLog
    return self.provinceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"section: %ld", section);
    return self.cityArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section: %ld; row: %ld", indexPath.section, indexPath.row);
    UITableViewCell *cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.cityArray[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section: %ld; row: %ld", indexPath.section, indexPath.row);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section: %ld; row: %ld", indexPath.section, indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    NSLog(@"section: %ld", section);
//    return self.provinceArray[section];
//}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    NSLog(@"section: %ld", section);
//    return self.footerArray[section];
//}

@end


