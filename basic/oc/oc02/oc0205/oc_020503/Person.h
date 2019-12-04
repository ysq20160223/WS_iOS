//
//  Person.h
//  oc_020503
//
//  Created by sq y on 2017/7/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    @private
    int _age;
    
    @protected
    NSString *_name;
}

@end
