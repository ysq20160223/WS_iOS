//
//  AudioListHeaderRv.m
//  Media
//
//  Created by Apple on 2022/11/28.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "AudioListHeaderRv.h"
#import "AudioTool.h"
#import "AudioModel.h"

#import <Masonry.h>



@interface AudioListHeaderRv () <UIScrollViewDelegate>

//@property (weak, nonatomic) IBOutlet UIImageView *ivBg;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@end



@implementation AudioListHeaderRv


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self = [NSBundle.mainBundle loadNibNamed:NSStringFromClass(self.class) owner:self options:nil].lastObject;
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setup {
    NSLog(@"%@", self);
    
//    self.backgroundColor = UIColor.magentaColor;
    
    NSArray<AudioModel *> *array = AudioTool.audioArray;
    
    
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    NSLog(@"w: %f; h: %f; %@", w, h, NSStringFromCGRect(self.frame));
    
    
    self.scrollView = [UIScrollView.alloc initWithFrame:CGRectMake(0, 0, w, h)];
    [self addSubview:self.scrollView];
    self.scrollView.delegate = self;
//    self.scrollView.backgroundColor = UIColor.cyanColor;
    self.scrollView.contentSize = CGSizeMake(array.count * w, 0); // 总的内容
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES; // 分页
    self.scrollView.delegate = self; // 代理
    NSLog(@"%@", NSStringFromCGSize(self.scrollView.contentSize));
//    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self);
//    }];
    NSLog(@"%@", NSStringFromCGRect(self.scrollView.frame));
    
    
    for (int i = 0; i < array.count; i++) {
        UIImageView *iv = [UIImageView.alloc initWithFrame:CGRectMake(i * w, 0, w, h)];
        [self.scrollView addSubview:iv];
        
        iv.image = [UIImage imageNamed:[array[i].nameNoSuffix stringByAppendingString:@".jpg"]];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(self);
            make.left.mas_equalTo(i * w);
            make.width.mas_equalTo(w);
        }];
        iv.clipsToBounds = YES;
        NSLog(@"%d; %@", i, NSStringFromCGRect(iv.frame));
        iv.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    
    // 添加 PageControl
    self.pageControl = UIPageControl.alloc.init;
    [self addSubview:self.pageControl];
    
    self.pageControl.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
//    self.pageControl.center = CGPointMake(w * 0.5, h - 50);
//    self.pageControl.bounds = CGRectMake(0, h - 50, w, 50);
    self.pageControl.numberOfPages = array.count;
    self.pageControl.pageIndicatorTintColor = UIColor.grayColor;
    self.pageControl.currentPageIndicatorTintColor = UIColor.whiteColor;
    self.pageControl.enabled = NO; // 默认为 YES
    self.pageControl.layer.cornerRadius = 6;
    self.pageControl.layer.masksToBounds = YES;
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-20);
//        make.center.mas_equalTo(w * 0.5);
        make.width.mas_equalTo(w * 0.6);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(36);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_WALLTIME_NOW, (int64_t) 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        XLog
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(switchImage) userInfo:nil repeats:YES];
    });
    
}

- (void)switchImage {
    NSInteger index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    if (index >= AudioTool.audioArray.count - 1) {
        index = -1;
    }
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * (index + 1), 0);
    NSLog(@"currentPage: %ld", self.pageControl.currentPage);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    XLog
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    XLog
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(switchImage) userInfo:nil repeats:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
//    NSLog(@"currentPage: %ld; offsetX: %.0f; w: %.0f", self.pageControl.currentPage, scrollView.contentOffset.x, scrollView.frame.size.width);
}

//- (void)onClickImageViewBg {
//    NSArray<AudioModel *> *array = AudioTool.audioArray;
//    int random = arc4random_uniform(array.count);
//    NSLog(@"random: %d", random);
//    if (random < 0) {
//        random = 0;
//    } else if (random >= array.count) {
//        random = array.count - 1;
//    }
//    AudioModel *audioModel = array[random];
//
//    self.ivBg.image = [UIImage imageNamed:audioModel.icon];
//}

@end


