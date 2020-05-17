//
//  TopicViewController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/25.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "TopicViewController.h"
#import "UIView+X.h"
#import "BSConst.h"

#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"

#import "XRefreshHeader.h"
#import "XRefreshFooter.h"

#import "TopicModel.h"
#import "TopicCell.h"
#import "CmtModel.h"
#import "UserModel.h"

#import "CmtController.h"

@interface TopicViewController () 

//
@property (nonatomic, strong) NSMutableArray<TopicModel *> *topicArray;

@property (nonatomic, strong) AFHTTPSessionManager *aFHTTPSessionManager;

@end



@implementation TopicViewController

- (TopicType)topicType {
    return TopicTypeAll;
}

static NSString *const TopicCellId = @"TopicCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
//    XLog
    self.view.backgroundColor = BSCommonBgColor;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(kTitleViewH + self.navigationController.navigationBar.xHeight, 0,
                                                   self.tabBarController.tabBar.xHeight + kStatusBarH, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TopicCell class]) bundle:nil] forCellReuseIdentifier:TopicCellId];
    
    [self setupRefresh];
    
}

- (void)setupRefresh {
    self.tableView.mj_header = [XRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestNetData)];
//    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [XRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestMoreNetData)];
}

- (void)requestNetData {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
        paraDict[@"a"] = @"list";
        paraDict[@"c"] = @"data";
        paraDict[@"type"] = @(self.topicType); //
//        NSLog(@"type: %ld", self.topicType);
        
        [weakSelf.aFHTTPSessionManager.tasks makeObjectsPerformSelector:@selector(cancel)];
        
        [weakSelf.aFHTTPSessionManager GET:commonUrl parameters:paraDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@", responseObject);
            
            [weakSelf.topicArray removeAllObjects];
            [weakSelf.topicArray addObjectsFromArray:[TopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
            
            // 有最热评论的情况
//            for (NSInteger i = 0; i < weakSelf.topicArray.count; i++) {
////                NSLog(@"i: %ld; %ld", i, weakSelf.topicArray[i].top_cmt.count);
//
//                if (weakSelf.topicArray[i].top_cmt.count) {
//                    CmtModel *cmtModel = weakSelf.topicArray[i].top_cmt[0];
//                    cmtModel.user.username = @"ABCDEFGHIJKLMN1234567890poiuytrewqasdfghjklmnbvcxz";
//                    cmtModel.content = @"";
//                    cmtModel.voiceuri = @"voiceuri";
//                    NSLog(@"i: %ld; %@", i, weakSelf.topicArray[i].top_cmt);
//                }
//            }
            
            [weakSelf.tableView reloadData];
            
            [weakSelf.tableView.mj_header endRefreshing];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf.tableView.mj_header endRefreshing];
            NSLog(@"error: %@", error);
        }];
    });
    
}

- (void)requestMoreNetData {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
        paraDict[@"a"] = @"list";
        paraDict[@"c"] = @"data";
        paraDict[@"type"] = @(self.topicType);
        
        [self.aFHTTPSessionManager.tasks makeObjectsPerformSelector:@selector(cancel)];
        
        [self.aFHTTPSessionManager GET:commonUrl parameters:paraDict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@", responseObject);
            
            NSArray<TopicModel *> *tempArray = [TopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            [weakSelf.topicArray addObjectsFromArray:tempArray];
            [weakSelf.tableView reloadData];
            
            [weakSelf.tableView.mj_footer endRefreshing];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self.tableView.mj_footer endRefreshing];
            NSLog(@"error: %@", error);
        }];
    });
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topicArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"row: %ld", indexPath.row)
    CGFloat height = self.topicArray[indexPath.row].cellHeight;
    
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:TopicCellId];
    cell.topicModel = self.topicArray[indexPath.row];
//    cell.xHeight = height; // 在此设置高度无效
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"row: %ld", indexPath.row)
    return self.topicArray[indexPath.row].cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%@", indexPath);
    
    CmtController *commentVc = [[CmtController alloc] init];
    commentVc.topicModel = self.topicArray[indexPath.row];
    [self.navigationController pushViewController:commentVc animated:YES];
}

#pragma mark -
- (NSMutableArray<TopicModel *> *)topicArray {
    if (nil == _topicArray) {
        _topicArray = [NSMutableArray array];
    }
    return _topicArray;
}

- (AFHTTPSessionManager *)aFHTTPSessionManager {
    if (nil == _aFHTTPSessionManager) {
        _aFHTTPSessionManager = [AFHTTPSessionManager manager];
    }
    return _aFHTTPSessionManager;
}

@end


