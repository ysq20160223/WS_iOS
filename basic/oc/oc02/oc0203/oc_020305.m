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
    int _cScore; // C 成绩
    int _ocScore; // OC 成绩
    int _totalScore; // 总分
    int _averageScore; // 平均分
}

- (void)setCSore:(int)cScore;
- (int)cScore;

- (void)setOcScore:(int)ocScore;
- (int)ocScore;

- (int)totalScore;
- (int)averageScore;

@end



@implementation Score

- (void)setCSore:(int)cScore {
    _cScore = cScore;
    
    _totalScore = _cScore + _ocScore;
    _averageScore = _totalScore / 2;
}

- (int)cScore {
    return _cScore;
}

- (void)setOcScore:(int)ocScore {
    _ocScore = ocScore;
    
    _totalScore = _cScore + _ocScore;
    _averageScore = _totalScore / 2;
}

- (int)ocScore {
    return _ocScore;
}

- (int)totalScore {
    return _totalScore;
}

- (int)averageScore {
    return _averageScore;
}

@end



int main() {
    Score *score = [Score new];
    [score setCSore:90];
    score.ocScore = 96; // 点语法 set
    
    NSLog(@"totalScore: %d, averageScore: %d", [score totalScore], score.averageScore); // 点语法 get
    return 0;
}


