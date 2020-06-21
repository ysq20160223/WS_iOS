//
//  UIImageView+X.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/5/7.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "UIImageView+X.h"
#import "UIImage+X.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (X)

- (void)xRect:(NSString *)url placeholder:(NSString *)placeholder {
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholder]];
}

- (void)xCircle:(NSString *)url placeholder:(NSString *)placeholder {
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage xCircleImageNamed:placeholder] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = [image xCircleImage];
    }];
}

@end
