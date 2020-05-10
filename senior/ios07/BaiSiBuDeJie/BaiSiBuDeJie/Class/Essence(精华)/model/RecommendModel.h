//
//  RecommendModel.h
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/5/4.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecommendModel : NSObject

@property (nonatomic, strong) NSString *theme_name;
@property (nonatomic, strong) NSString *image_list;
@property (nonatomic, assign) NSInteger sub_number;
@property (nonatomic, assign) NSInteger is_sub;

@end

NS_ASSUME_NONNULL_END
