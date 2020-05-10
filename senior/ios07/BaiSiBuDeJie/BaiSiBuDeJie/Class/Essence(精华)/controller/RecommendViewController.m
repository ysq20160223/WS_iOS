//
//  RecommendViewController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/19.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "RecommendViewController.h"

#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
#import "MJExtension.h"

#import "BSConst.h"
#import "RecommendModel.h"

#import "RecommendCell.h"

@interface RecommendViewController ()

@property (nonatomic, strong) NSMutableArray<RecommendModel *> *recommendModelArray;
@property (nonatomic, strong) AFHTTPSessionManager *afHttpSessionManager;

@property (nonatomic, strong) MBProgressHUD *mbProgressHUD;

@end



@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    XLog
//    self.view.backgroundColor = XColor(0xee, 0xee, 0xee);
    self.navigationItem.title = @"Recommend";
    
    //
    self.tableView.rowHeight = 64;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendCell class]) bundle:nil]  forCellReuseIdentifier:@"RecommendCell"];
    
    //
    self.mbProgressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.mbProgressHUD.backgroundView.color = XColorAlpha(0xcc, 0xcc, 0xcc, 0xff);
    self.mbProgressHUD.backgroundView.style = MBProgressHUDAnimationFade;
    [self.mbProgressHUD showAnimated:YES];
    
    NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
    paraDict[@"a"] = @"tag_recommend";
    paraDict[@"action"] = @"sub";
    paraDict[@"c"] = @"topic";
    
    __weak typeof(self) weakSelf = self;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        XLog
        [weakSelf.afHttpSessionManager GET:commonUrl parameters:paraDict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [weakSelf.mbProgressHUD hideAnimated:YES];
        //        NSLog(@"%@", responseObject);
                
                NSMutableArray<RecommendModel *> *array = [RecommendModel mj_objectArrayWithKeyValuesArray:responseObject];
//                NSLog(@"%@", array);
                
                [weakSelf.recommendModelArray addObjectsFromArray:array];
                [weakSelf.tableView reloadData];
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [weakSelf.mbProgressHUD hideAnimated:YES];
                NSLog(@"%@", error);
            }];
    });
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    XLog
    
    [self.afHttpSessionManager.tasks makeObjectsPerformSelector:@selector(cancel)];
//    [self.afHttpSessionManager invalidateSessionCancelingTasks:YES resetSession:YES];
}


#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecommendCell"];
    cell.recommendModel = self.recommendModelArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recommendModelArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


#pragma mark - lazy load
- (AFHTTPSessionManager *)afHttpSessionManager {
    if (nil == _afHttpSessionManager) {
        _afHttpSessionManager = [AFHTTPSessionManager manager];
    }
    return _afHttpSessionManager;
}

- (NSMutableArray *)recommendModelArray {
    if (nil == _recommendModelArray) {
        _recommendModelArray = [NSMutableArray array];
    }
    return _recommendModelArray;
}


@end


