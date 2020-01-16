//
//  ViewController.m
//  ios_03020107
//
//  Created by Apple on 11/01/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource> {
    NSArray *_aresArrray;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    
    _aresArrray = @[
                    @{
                        @"header" : @"福建",
                        @"footer" : @"fj",
                        @"cities" : @[@"福州", @"厦门", @"莆田"]
                        },
                    
                    @{
                        @"header" : @"广东",
                        @"footer" : @"gd",
                        @"cities" : @[@"广州", @"深圳"]
                        }
                    ];
    
}

#pragma mark -- UITableViewDataSource start

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _aresArrray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_aresArrray[section][@"cities"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = _aresArrray[indexPath.section][@"cities"][indexPath.row];
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _aresArrray[section][@"header"];
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return _aresArrray[section][@"footer"];
}

#pragma mark -- UITableViewDataSource end


@end


