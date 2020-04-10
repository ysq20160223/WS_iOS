//
//  MeClearCacheCell.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/5.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "MeClearCacheCell.h"

#import "NSString+X.h"
#import "MBProgressHUD.h"

@implementation MeClearCacheCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.text = @"Clear Cache(Calculating)";
        self.userInteractionEnabled = NO;
        self.imageView.image = nil;
        
//        NSLog(@"%@", );
        
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
        [indicatorView startAnimating];
        self.accessoryView = indicatorView;
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickClearCache)]];
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            //                NSLog(@"%@", [NSThread currentThread]);
            [NSThread sleepForTimeInterval:7];
            
            NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
            //                NSLog(@"%@", cachePath);
            unsigned long long size = [cachePath stringByAppendingPathComponent:@"com.hackemist.SDWebImageCache.default"].fileSize;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //                    NSLog(@"%@", [NSThread currentThread]);
                self.textLabel.text = [NSString stringWithFormat:@"Clear Cache(%lldB)", size];
                
                self.accessoryView = nil;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                self.userInteractionEnabled = YES;
            });
        });
    }
    
    return self;
}

- (void)clickClearCache {
    NSLog(@"");
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.superview animated:YES];
    //            hud.contentColor = [UIColor colorWithRed:0.f green:0.6f blue:0.7f alpha:1.f];
    //            hud.label.text = @"Clear Cache ...";
    
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.5f alpha:0.3f];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [NSThread sleepForTimeInterval:3];
        
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"com.hackemist.SDWebImageCache.default"];
        NSLog(@"%@", cachePath);
        
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        [fileMgr removeItemAtPath:cachePath error:nil];
        [fileMgr createDirectoryAtPath:cachePath withIntermediateDirectories:YES attributes:nil error:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
            self.textLabel.text = @"Clear Cache(0KB)";
        });
    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark -
- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIActivityIndicatorView *indicatorView = (UIActivityIndicatorView *)self.accessoryView;
    [indicatorView startAnimating];
}

@end
