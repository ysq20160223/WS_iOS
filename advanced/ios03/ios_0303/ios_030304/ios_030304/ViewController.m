//
//  ViewController.m
//  ios_030304
//
//  Created by Apple on 2017/7/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Shop.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *shopArray;
@property (strong, nonatomic) NSMutableArray *checkedShopArray;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shopArray = [NSMutableArray array];
    self.checkedShopArray = [NSMutableArray array];
    
    NSInteger screenW = self.view.frame.size.width;
    NSInteger screenH = self.view.frame.size.height;
    
    self.toolbar.frame = CGRectMake(0, kStatusBarH, screenW, 44);
    self.lblTitle.frame = CGRectMake(0, self.toolbar.frame.origin.y + self.toolbar.frame.size.height, screenW, 44);
    
    self.tableView.frame = CGRectMake(0, self.lblTitle.frame.origin.y + self.lblTitle.frame.size.height, screenW, screenH - kStatusBarH - self.toolbar.frame.size.height - self.lblTitle.frame.size.height);
    self.tableView.backgroundColor = [UIColor colorWithRed:1 green:.6 blue:0 alpha:.6];
    
    
    // 1
    NSArray *array = [NSArray arrayWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"shops" ofType:@"plist"]];
    
    // 2
    for (NSDictionary *dict in array) {
        [self.shopArray addObject:[Shop shopWithDict:dict]];
    }
    //    NSLog(@"count: %ld", self.shop.count);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.checkedShopArray.count) {
        self.lblTitle.text = [NSString stringWithFormat:@"Toolbar(%ld)", self.checkedShopArray.count];
    } else {
        self.lblTitle.text = @"Toolbar";
    }
    self.barBtnItemTrash.enabled = self.checkedShopArray.count;
    return self.shopArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    NSLog(@"row: %ld; cell: %p", indexPath.row, cell);
    
    Shop *shop = self.shopArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %ld", shop.name, indexPath.row];
    cell.detailTextLabel.text = shop.desc;
    cell.imageView.image = [UIImage imageNamed:shop.icon];
    
    if ([self.checkedShopArray containsObject:shop]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark; // 选中
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone; // 取消选中
    }
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 77;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelect: %ld", indexPath.row);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 取消默认选中的背景
    
    Shop *shop = self.shopArray[indexPath.row];
    if ([self.checkedShopArray containsObject:shop]) {
        [self.checkedShopArray removeObject:shop]; // 取消选中
    } else {
        [self.checkedShopArray addObject:shop]; // 存储选中的模型对象
    }
    
    //    [tableView reloadData]; // 全部刷新
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic]; // 刷新
}

- (IBAction)onClickBarBtnItemTrash:(UIBarButtonItem *)sender {
    [UIView animateWithDuration:5 animations:^{
        NSMutableArray *checkedIndexPathArray = [NSMutableArray array];
        for (Shop *shop in self.checkedShopArray) {
            NSInteger row = [self.shopArray indexOfObject:shop];
            NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
            [checkedIndexPathArray addObject:path];
        }
        
        [self.shopArray removeObjectsInArray:self.checkedShopArray]; // 1, 删除模型数据
        [self.checkedShopArray removeAllObjects]; // 1-1, 删除选中数据
        
        [self.tableView deleteRowsAtIndexPaths:checkedIndexPathArray withRowAnimation:UITableViewRowAnimationRight];
    } completion:^(BOOL finished) {
        NSLog(@"reloadData");
        [self.tableView reloadData]; // 2, 刷新表格
    }];
}


@end


