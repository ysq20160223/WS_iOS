//
//  oc_020305.m
//  
//
//  Created by Apple on 2017/7/9.
//
//

/*
    功能：
        比较 C 语言成绩, 跟另外一个成绩对象比较, 返回成绩差
        计算总分
        计算平均分
 
    01, 编译运行 : cc oc_020305.m -framework Foundation
 */

#import <Foundation/Foundation.h>

#define DEBUG
#import "../../../../PrefixHeader.pch"


@interface Score : NSObject {
    int _c; // C 成绩
    int _oc; // OC 成绩
    int _total; // 总分
    int _average; // 平均分
}

- (void)setC:(int)cScore;
- (int)c;

- (void)setOc:(int)ocScore;
- (int)oc;

- (int)total;
- (int)average;
@end


@implementation Score

- (void)setC:(int)c {
    _c = c;
    
    _total = _c + _oc;
    _average = _total / 2;
}

- (int)c {
    return _c;
}

- (void)setOc:(int)oc {
    _oc = oc;
    
    _total = _c + _oc;
    _average = _total / 2;
}

- (int)oc {
    return _oc;
}

- (int)total {
    return _total;
}

- (int)average {
    return _average;
}

@end



int main() {
    Score *score = [Score new];
    [score setC:90];
    score.oc = 96; // 点语法 set
    
    NSLog(@"total: %d; average: %d", [score total], score.average); // 点语法 get
    return 0;
}


