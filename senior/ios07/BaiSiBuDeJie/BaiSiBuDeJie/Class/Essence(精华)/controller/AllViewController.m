//
//  AllViewController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/8.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "AllViewController.h"
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

@interface AllViewController ()

//
@property (nonatomic, strong) NSMutableArray<TopicModel *> *topicArray;

@property (nonatomic, strong) AFHTTPSessionManager *aFHTTPSessionManager;

@end



@implementation AllViewController

static NSString *const TopicCellId = @"TopicCellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    XLog
    self.view.backgroundColor = BSCommonBgColor;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.contentInset = UIEdgeInsetsMake(kTitleViewH + self.navigationController.navigationBar.xHeight, 0,
                                                self.tabBarController.tabBar.xHeight + kStatusBarH, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TopicCell class]) bundle:nil] forCellReuseIdentifier:TopicCellId];
    
    [self setupRefresh];
    
}

- (void)setupRefresh {
    self.tableView.mj_header = [XRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestNetData)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [XRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestMoreNetData)];
}

- (void)requestNetData {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
        paraDict[@"a"] = @"list";
        paraDict[@"c"] = @"data";
        
        [self.aFHTTPSessionManager.tasks makeObjectsPerformSelector:@selector(cancel)];
        
        [self.aFHTTPSessionManager GET:commonUrl parameters:paraDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@", responseObject);
        
            [self.topicArray removeAllObjects];
            [self.topicArray addObjectsFromArray:[TopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
            [weakSelf.tableView reloadData];
            
            [self.tableView.mj_header endRefreshing];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self.tableView.mj_header endRefreshing];
            NSLog(@"error: %@", error);
        }];
    });
    
}

- (void)requestMoreNetData {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
        paraDict[@"a"] = @"list";
        paraDict[@"c"] = @"data";
        
        [self.aFHTTPSessionManager.tasks makeObjectsPerformSelector:@selector(cancel)];
        
        [self.aFHTTPSessionManager GET:commonUrl parameters:paraDict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@", responseObject);
            
            NSArray<TopicModel *> *tempArray = [TopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            [self.topicArray addObjectsFromArray:tempArray];
            [weakSelf.tableView reloadData];
            
            [self.tableView.mj_footer endRefreshing];
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

    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:TopicCellId];
 
    TopicModel *topicModel = self.topicArray[indexPath.row];
    cell.topicModel = topicModel;
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
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


