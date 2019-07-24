//
//  Person.h
//  oc_0306
//
//  Created by sq y on 2017/7/14.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "Book.h"

@interface Person : NSObject {
    Book *_book;
}

- (void)setBook:(Book *)book;
- (Book *)book;

@end
