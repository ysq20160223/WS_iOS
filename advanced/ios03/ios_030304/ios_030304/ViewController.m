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
{
    NSMutableArray *_shop;
    NSMutableArray *_deleteShop; // 选中的 cell
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _shop = [NSMutableArray array];
    _deleteShop = [NSMutableArray array];
    
    // 1
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shops.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    // 2
    for (NSDictionary *dict in array) {
//        Shop *s = [[Shop alloc] initWithDict:dict]; // 1
        Shop *s = [Shop shopWithDict:dict]; // 2
        
        [_shop addObject:s];
    }
    
//    NSLog(@"count : %ld", _shop.count);
    
}

// 1, 每一组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(0 == _deleteShop.count) {
        _titleLabel.text = @"Tb";
        _trash.enabled = NO;
    } else {
        _titleLabel.text = [NSString stringWithFormat:@"Tb(%ld)", _deleteShop.count];
        _trash.enabled = YES;
    }
    
    return _shop.count;
}

// 2, 每一行的数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
//    cell.textLabel.text= [NSString stringWithFormat:@"row : %ld", indexPath.row];
    Shop *s = _shop[indexPath.row];
    
    cell.textLabel.text = s.name;
    
    cell.detailTextLabel.text = s.desc;
    
    cell.imageView.image = [UIImage imageNamed:s.icon];
    
    // 检测选中状态
    if ([_deleteShop containsObject:s]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark; // 选中
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone; // 取消选中
    }
    
    return cell;
}


// 行高
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 77;
}

//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 0, 取消默认选中的背景
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 1, 取出 indexPath 对应的 cell
//    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
//    selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    Shop *s = _shop[indexPath.row];
    
    if([_deleteShop containsObject:s]) {
        [_deleteShop removeObject:s]; // 取消选中
    } else {
        [_deleteShop addObject:s]; // 存储选中的模型对象
    }
    
    // 在 cellForRowAtIndexPath 中实现
    // title 和 trash图标
//    if(0 == _deleteShop.count) {
//        _titleLabel.text = @"Tb";
//        _trash.enabled = NO;
//    } else {
//        _titleLabel.text = [NSString stringWithFormat:@"Tb(%ld)", _deleteShop.count];
//        _trash.enabled = YES;
//    }
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic]; // 刷新
    
}

// 删除模型数据
- (IBAction)trash:(UIBarButtonItem *)sender {
    // 0, 获得将要删除数据的行号
    NSMutableArray *deletePaths = [NSMutableArray array];
    for (Shop *s in _deleteShop) {
        long row = [_shop indexOfObject:s];
        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
        [deletePaths addObject:path];
    }
    
    [_shop removeObjectsInArray:_deleteShop]; // 1, 删除模型数据
    
    [_deleteShop removeAllObjects]; // 1-1, 删除选中数据
    
//    [_tableView reloadData]; // 2, 刷新表格
    [self.tableView deleteRowsAtIndexPaths:deletePaths withRowAnimation:UITableViewRowAnimationRight];
    
    // 在 cellForRowAtIndexPath 中实现
//    _titleLabel.text = @"Tb"; // title
//    _trash.enabled = NO;
}


@end





