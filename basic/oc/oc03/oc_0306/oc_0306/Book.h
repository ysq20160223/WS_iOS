//
//  Book.h
//  oc_0306
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../../../../../PreHeader.h"

@interface Book : NSObject {
    int _price;
}

- (void)setPrice:(int) price;
- (int)price;

@end
