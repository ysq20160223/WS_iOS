//
//  c_060307.c
//  
//
//  Created by Apple on 2019/5/26.
//
//

#include <stdio.h>

int sumAndMinus(int, int, int *);

int main() {

    int a = 1, b = 2;
    int minus;
    int sum = sumAndMinus(a, b, &minus);
    printf("a: %d; b: %d; a - b = %d; a + b = %d\n", a, b, minus, sum);

    return 0;
}


// 利用指针同时返回多个值
int sumAndMinus(int a, int b, int *minus) {
    *minus = a - b;
    return a + b;
}


