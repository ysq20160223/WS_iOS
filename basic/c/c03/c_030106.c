//
//  c_030106.c
//  
//
//  Created by Apple on 2017/7/1.
//
//
// 01, 练习

#include <stdio.h>

int main() {
    printf("please input a number: ");
    
    int score;
    
    scanf("%d", &score);
    
    if (score >= 90) {
        printf("score %d level is: A\n", score);
    } else if (score >= 80) {
        printf("score %d level is: B\n", score);
    } else if (score >= 70) {
        printf("score %d level is: C\n", score);
    } else if (score >= 60) {
        printf("score %d level is: D\n", score);
    } else {
        printf("score %d level is: E\n", score);
    }
    
    return 0;
}


