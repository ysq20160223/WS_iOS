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
#import "LrcLabel.h"

#import "Masonry.h"

@interface LrcScrollView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *lrcArray;

@property (nonatomic, assign) NSInteger curLrcLineIndex;

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
    UITableView *tableView = UITableView.alloc.init;
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
    
    if (self.curLrcLineIndex == indexPath.row) {
        cell.lrcLabel.font = [UIFont systemFontOfSize:21];
    } else {
        cell.lrcLabel.font = [UIFont systemFontOfSize:12];
        cell.lrcLabel.curProgress = 0;
    }
    
    LrcLineModel *lrcLineModel = self.lrcArray[indexPath.row];
    //    cell.textLabel.text = [NSString stringWithFormat:@"row: %ld", indexPath.row];
    cell.lrcLabel.text = lrcLineModel.text;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark -
- (void)setLrcName:(NSString *)lrcName {
    [self.tableView setContentOffset:CGPointMake(0, -self.tableView.bounds.size.height * 0.5) animated:NO];
    
    self.curLrcLineIndex = 0;
    
    _lrcName = [lrcName copy];
    
    // parse
    self.lrcArray = [LrcTool lrcToolWithLrcName:lrcName];
//    NSLog(@"%@", self.lrcArray);
    LrcLineModel *firstLrcLineModel = self.lrcArray[0];
    self.lrcLabel.text = firstLrcLineModel.text;
    
    //
    [self.tableView reloadData];
}

#pragma mark -
- (void)setLrcCurTime:(NSTimeInterval)lrcCurTime {
    _lrcCurTime = lrcCurTime;
    
    //
    NSInteger count = self.lrcArray.count;
    for (NSInteger i = 0; i < count; i++) {
        // 当前
        LrcLineModel *curLrcLineModel = self.lrcArray[i];
        
        // 下一句歌词
        NSInteger nextIndex = i + 1;
        LrcLineModel *nextLrcLineModel = nil;
        if (nextIndex < self.lrcArray.count) {
            nextLrcLineModel = self.lrcArray[nextIndex];
        }
        
        //
        if (self.curLrcLineIndex != i && lrcCurTime >= curLrcLineModel.time && lrcCurTime < nextLrcLineModel.time) {
            // 1,
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:self.curLrcLineIndex inSection:0];
            
            // 2, 记录当前刷新的某行
            self.curLrcLineIndex = i;
            
            // 3, 刷新当前这句歌词, 并且刷新上一句歌词
            [self.tableView reloadRowsAtIndexPaths:@[indexPath, previousIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            // 4, 将当前的歌词滚动到中间
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
            
            // 5, 设置主界面的文字
            self.lrcLabel.text = curLrcLineModel.text;
        }
        if (self.curLrcLineIndex == i) { // 当前这句歌词
            // 1, 取出当前歌词的时间
//            LrcLineModel *curLrcLineModel = self.lrcArray[self.curLrcLineIndex];
//
//            // 2, 取出下一句歌词
//            NSInteger nextIndex = self.curLrcLineIndex + 1;
//            LrcLineModel *nextLrcLineModel = nil;
//            if (nextIndex < self.lrcArray.count) {
//                nextLrcLineModel = self.lrcArray[nextIndex];
//            }
            
            // 3
            CGFloat value = (lrcCurTime - curLrcLineModel.time) / (nextLrcLineModel.time - curLrcLineModel.time);
            
            // 4
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.curLrcLineIndex inSection:0];
            LrcTableViewCell *lrcTableViewCell = [self.tableView cellForRowAtIndexPath:indexPath];
            lrcTableViewCell.lrcLabel.curProgress = value;
            
            // 5
            self.lrcLabel.curProgress = value;
//            NSLog(@"value: %f", value);
        }
    }
}


@end


