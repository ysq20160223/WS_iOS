//
//  RecommendModel.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/5/4.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel

- (NSString *)description {
    return [NSString stringWithFormat:@"theme_name: %@; sub_number: %ld; is_sub: %ld; image_list: %@", self.theme_name, self.sub_number, self.is_sub, self.image_list];
}

@end
