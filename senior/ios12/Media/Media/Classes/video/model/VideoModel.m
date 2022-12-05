//
//  VideoModel.m
//  Media
//
//  Created by Apple on 2022/9/4.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

- (NSString *)description {
    return [NSString stringWithFormat:@"%@[name: %@; filename: %@; author: %@; icon: %@", self.class, self.name, self.filename, self.author, self.icon];
}

@end


