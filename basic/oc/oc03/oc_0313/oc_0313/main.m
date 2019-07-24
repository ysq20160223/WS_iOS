//
//  main.m
//  oc_0313
//
//  Created by sq y on 2017/7/15.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../../../../../PreHeader.h"

#import "Book.h"
#import "Person.h"

int main() {
    
    Person *person = [[Person alloc] init];
    
    Book *book = [[Book alloc] init];
    [person setBook:book];
    
    
    [book release];
    [person release];
    
    return 0;
}
