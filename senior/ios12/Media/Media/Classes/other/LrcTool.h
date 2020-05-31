//
//  LrcTool.h
//  Media
//
//  Created by Apple on 2020/5/24.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LrcLineModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LrcTool : NSObject

+ (NSArray<LrcLineModel *> *)lrcToolWithLrcName:(NSString *)lrcName;

@end

NS_ASSUME_NONNULL_END
