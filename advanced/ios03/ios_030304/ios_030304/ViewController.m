//
//  ViewController.m
//  ios_030304
//
//  Created by Apple on 2017/7/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "../../../../PreHeader.h"

#import "Shop.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_shopArray;
    NSMutableArray *_checkedShopArray;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _shopArray = [NSMutableArray array];
    _checkedShopArray = [NSMutableArray array];
    
    
    // 修改 Toolbar
    _toolbar.frame = CGRectMake(0, kStatusBarH, kViewControllerW, 64);
    
    // 修改 Label
    _titleLabel.frame = CGRectMake(0, _toolbar.frame.origin.y + _toolbar.frame.size.height + kStatusBarH, kViewControllerW, 64);
    
    // 修改 TableView
    _tableView.frame = CGRectMake(0, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + kStatusBarH, kViewControllerW, kViewControllerH - _toolbar.frame.size.height - _titleLabel.frame.size.height - 2 * kStatusBarH);
    _tableView.backgroundColor = [UIColor lightGrayColor];
    
    
    // 1
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shops.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    // 2
    for (NSDictionary *dict in array) {
        Shop *s = [Shop shopWithDict:dict];
        [_shopArray addObject:s];
    }
    //    NSLog(@"count: %ld", _shop.count);
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"section: %ld", section);
    
    if (0 == _checkedShopArray.count) {
        _titleLabel.text = @"Toolbar";
        _trash.enabled = NO;
    } else {
        _titleLabel.text = [NSString stringWithFormat:@"Toolbar(%ld)", _checkedShopArray.count];
        _trash.enabled = YES;
    }
    return _shopArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell: %ld", indexPath.row);
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    Shop *shop = _shopArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %ld", shop.name, indexPath.row];
    cell.detailTextLabel.text = shop.desc;
    cell.imageView.image = [UIImage imageNamed:shop.icon];
    
    if ([_checkedShopArray containsObject:shop]) {
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
    
    Shop *shop = _shopArray[indexPath.row];
    if ([_checkedShopArray containsObject:shop]) {
        [_checkedShopArray removeObject:shop]; // 取消选中
    } else {
        [_checkedShopArray addObject:shop]; // 存储选中的模型对象
    }
    
    //    [tableView reloadData]; // 全部刷新
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic]; // 刷新
}

- (IBAction)trash:(UIBarButtonItem *)sender {
    [UIView animateWithDuration:5 animations:^{
        NSMutableArray *checkedIndexPathArray = [NSMutableArray array];
        for (Shop *shop in _checkedShopArray) {
            NSInteger row = [_shopArray indexOfObject:shop];
            NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
            [checkedIndexPathArray addObject:path];
        }
        
        [_shopArray removeObjectsInArray:_checkedShopArray]; // 1, 删除模型数据
        [_checkedShopArray removeAllObjects]; // 1-1, 删除选中数据
        
        [self.tableView deleteRowsAtIndexPaths:checkedIndexPathArray withRowAnimation:UITableViewRowAnimationRight];
    } completion:^(BOOL finished) {
        NSLog(@"reloadData");
        [_tableView reloadData]; // 2, 刷新表格
    }];
}


@end





