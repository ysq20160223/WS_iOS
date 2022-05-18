//
//  Book.h
//  oc_0306
//
//  Created by Apple on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject {
    int _price;
}

- (void)setPrice:(int) price;
- (int)price;

@end


