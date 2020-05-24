//
//  LrcScrollView.m
//  Media
//
//  Created by Apple on 2020/5/24.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "LrcScrollView.h"

#import "LrcTableViewCell.h"
#import "LrcTool.h"
#import "LrcLineModel.h"

#import "Masonry.h"

@interface LrcScrollView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *lrcArray;

@end



@implementation LrcScrollView

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setupTableView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupTableView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self makeConstraintsTableView];
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    
    //
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(self.bounds.size.height / 2, 0, self.bounds.size.height / 2, 0);
    
}


#pragma mark -
- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self addSubview:tableView];
    
    self.tableView = tableView;
}

- (void)makeConstraintsTableView {
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(self.mas_height);
        make.right.equalTo(self.mas_right);
        make.left.equalTo(self.mas_left).offset(self.bounds.size.width);
        make.width.equalTo(self.mas_width);
    }];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lrcArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LrcTableViewCell *cell = [LrcTableViewCell lrcCell:tableView];
    
    LrcLineModel *lrcLineModel = self.lrcArray[indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"row: %ld", indexPath.row];
    cell.textLabel.text = lrcLineModel.text;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark -
- (void)setLrcName:(NSString *)lrcName {
    _lrcName = [_lrcName copy];
    
    // parse
    self.lrcArray = [LrcTool lrcToolWithLrcName:lrcName];
//    NSLog(@"%@", self.lrcArray);
    
    //
    [self.tableView reloadData];
}


@end
