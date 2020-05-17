//
//  CommentController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/5/10.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "CmtController.h"

#import "XRefreshHeader.h"
#import "XRefreshFooter.h"

#import "AFNetworking.h"
#import "MJExtension.h"

#import "BSConst.h"
#import "CmtModel.h"
#import "UserModel.h"
#import "CmtTableViewHeaderFooterView.h"
#import "CmtCell.h"
#import "TopicCell.h"

#import "UIView+X.h"

#define kCmtCellId @"CmtCellId"
#define kSectionHeaderId @"sectionHeaderId"
#define kCmtSectionHeaderFont [UIFont systemFontOfSize:15]

@interface CmtController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cmtViewBottomConstraints;

@property (nonatomic, strong) AFHTTPSessionManager *aFHTTPSessionManager;

@property (nonatomic, strong) NSMutableArray<CmtModel *> *lastestTopicModelArray;
@property (nonatomic, strong) NSMutableArray<CmtModel *> *hotTopicModelArray;

//
@property (nonatomic, strong) NSArray<CmtModel *> *top_cmt;

@end



@implementation CmtController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    NSLog(@"%@", self.topicModel);
    self.navigationItem.title = @"Comment";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [self setupTableView];
    
    [self setupRefresh];
    
    [self setupHeaderView];
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CmtCell class]) bundle:nil] forCellReuseIdentifier:kCmtCellId];
    [self.tableView registerClass:[CmtTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:kSectionHeaderId];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = BSCommonBgColor;
    
    self.tableView.sectionHeaderHeight = kCmtSectionHeaderFont.lineHeight * 2;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
}

- (void)setupHeaderView {
    // 处理 HOT Cmt
    self.top_cmt = self.topicModel.top_cmt;
    self.topicModel.top_cmt = nil;
    self.topicModel.cellHeight = 0;
    
    //
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = BSCommonBgColor;
    headView.xHeight = self.topicModel.cellHeight + BSMargin;
    
    TopicCell *topicCell = [TopicCell xViewFromXib];
    topicCell.topicModel = self.topicModel;
    topicCell.frame = CGRectMake(0, -BSMargin, kScreenW, self.topicModel.cellHeight + BSMargin);
//    NSLog(@"%@", NSStringFromCGRect(topicCell.frame));
    
    [headView addSubview:topicCell];
//     NSLog(@"%@", NSStringFromCGRect(headView.frame));
    self.tableView.tableHeaderView = headView;
}

- (void)setupRefresh {
    self.tableView.mj_header = [XRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestNetData)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [XRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestMoreNetData)];
}

- (void)requestNetData {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
        paraDict[@"a"] = @"dataList";
        paraDict[@"c"] = @"comment";
        paraDict[@"data_id"] = @(self.topicModel.ID); //
        paraDict[@"hot"] = @1;
        
        [weakSelf.aFHTTPSessionManager.tasks makeObjectsPerformSelector:@selector(cancel)];
        [weakSelf.aFHTTPSessionManager GET:commonUrl parameters:paraDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@", responseObject);
            
            [weakSelf.lastestTopicModelArray removeAllObjects];
            [weakSelf.hotTopicModelArray removeAllObjects];
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSArray<CmtModel *> *tempArray = [CmtModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                
                [weakSelf.lastestTopicModelArray addObjectsFromArray:tempArray];
                [weakSelf.hotTopicModelArray addObjectsFromArray:[CmtModel mj_objectArrayWithKeyValuesArray:responseObject[@"hot"]]];
                NSLog(@"lastest count: %ld; hot count: %ld", weakSelf.lastestTopicModelArray.count, weakSelf.hotTopicModelArray.count);
            }
            
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
        paraDict[@"a"] = @"dataList";
        paraDict[@"c"] = @"comment";
        paraDict[@"data_id"] = @(self.topicModel.ID); //
//        paraDict[@"hot"] = @1;
        if (self.lastestTopicModelArray.count) {
            paraDict[@"lastcid"] = @(self.lastestTopicModelArray.lastObject.ID); //
        }

        [self.aFHTTPSessionManager.tasks makeObjectsPerformSelector:@selector(cancel)];
        [self.aFHTTPSessionManager GET:commonUrl parameters:paraDict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@", responseObject);
            
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSArray<CmtModel *> *tempArray = [CmtModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                
                [weakSelf.lastestTopicModelArray addObjectsFromArray:tempArray];
                NSLog(@"lastest count: %ld", weakSelf.lastestTopicModelArray.count);
            }
            
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_footer endRefreshing];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf.tableView.mj_footer endRefreshing];
            NSLog(@"error: %@", error);
        }];
    });
    
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification {
//    NSLog(@"%@", notification.userInfo);
    
    // change constraints
    CGFloat keyboardY = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    self.cmtViewBottomConstraints.constant = screenH - keyboardY;
    
    [UIView animateWithDuration:[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}


#pragma mark - UITableViewDataSource start
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    if (0 == section && self.hotTopicModelArray.count) {
//        return @"Hot";
//    }
//    return @"Lastest";
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.hotTopicModelArray.count) {
        return 2;
    }
    if (self.lastestTopicModelArray.count) {
        return 1;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section && self.hotTopicModelArray.count) {
        return self.hotTopicModelArray.count;
    }
    return self.lastestTopicModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"hot size: %ld; lastest size: %ld", self.hotTopicModelArray.count, self.lastestTopicModelArray.count);
    CmtCell *cell = [tableView dequeueReusableCellWithIdentifier:kCmtCellId];
    
    CmtModel *cmtModel;
    if (0 == indexPath.section) {
        if (self.hotTopicModelArray.count) {
            cmtModel = self.hotTopicModelArray[indexPath.row];
        } else {
            cmtModel = self.lastestTopicModelArray[indexPath.row];
        }
    } else if (1 == indexPath.section && self.lastestTopicModelArray.count) {
        cmtModel = self.lastestTopicModelArray[indexPath.row];
    }
    cmtModel.index = indexPath.row;
    cell.cmtModel = cmtModel;
    return cell;
}

#pragma mark - UITableViewDataSource end


#pragma mark - UITableViewDelegate start
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// 自定义
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIButton *btn = [[UIButton alloc] init];
//    btn.backgroundColor = BSCommonBgColor;
//    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft; // 居左对齐
//
//    //
////    btn.titleLabel.backgroundColor = [UIColor orangeColor];
//    btn.titleLabel.font = kCmtSectionHeaderFont;
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//
//    if (0 == section && self.hotTopicModelArray.count) {
//        btn.titleEdgeInsets = UIEdgeInsetsMake(0, BSMargin, 0, 0);
//        [btn setTitle:@"Hot" forState:UIControlStateNormal];
//    } else {
//        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 2 * BSMargin, 0, 0);
//        [btn setTitle:@"Lastest" forState:UIControlStateNormal];
//    }
//    return btn;
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CmtTableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kSectionHeaderId];

    self.tableView.sectionHeaderHeight = kCmtSectionHeaderFont.lineHeight * 2;
    
    if (0 == section && self.hotTopicModelArray.count) {
        view.textLabel.text = @"HOT";
    } else {
        view.textLabel.text = @"LASTEST";
    }
    return view;
}


#pragma mark - UITableViewDelegate end

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    self.topicModel.top_cmt = self.top_cmt;
    self.topicModel.cellHeight = 0;
}

#pragma mark - lazy load
- (AFHTTPSessionManager *)aFHTTPSessionManager {
    if (nil == _aFHTTPSessionManager) {
        _aFHTTPSessionManager = [AFHTTPSessionManager manager];
    }
    return _aFHTTPSessionManager;
}

- (NSMutableArray *)lastestTopicModelArray {
    if (!_lastestTopicModelArray) {
        _lastestTopicModelArray = [NSMutableArray array];
    }
    return _lastestTopicModelArray;
}

- (NSMutableArray *)hotTopicModelArray {
    if (!_hotTopicModelArray) {
        _hotTopicModelArray = [NSMutableArray array];
    }
    return _hotTopicModelArray;
}
\

@end
