//
//  ViewController.m
//  ios_03020107
//
//  Created by Apple on 11/01/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "ViewController.h"

#define kHeader @"header"
#define kFooter @"footer"
#define kCity @"city"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *aresArray;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [UITableView.alloc initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    
    self.aresArray = @[
                        @{
                            kHeader : @"FuJian",
                            kFooter : @"FJ",
                            kCity : @[@"FuZhou", @"XiaMen", @"PuTian"]
                        },
                        
                        @{
                            kHeader : @"GuangDong",
                            kFooter : @"GD",
                            kCity : @[@"GuangZhou", @"ShenZhen"]
                        }
                    ];
    
}

#pragma mark -- UITableViewDataSource start

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.aresArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.aresArray[section][kCity] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = _aresArray[indexPath.section][kCity][indexPath.row];
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.aresArray[section][kHeader];
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.aresArray[section][kFooter];
}

#pragma mark -- UITableViewDataSource end


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end


