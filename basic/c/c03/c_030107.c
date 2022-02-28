//
//  c_030107.c
//
//
//  Created by Apple on 2017/7/1.
//
//

/*
 01, 如果要在 case 后面定义变量必须加 {}
 02, java 在 case 后面可以定义变量
 
 */

#include <stdio.h>

int fun_01() {
    char c = '+';
    int a = 1, b = 2;
    
    switch (c) {
        case '+': {
            int sum = a + b;
            printf("sum = %d\n", sum);
            break;
        }
            
        case '-': {
            int minus = a - b;
            printf("minus = %d\n", minus);
            break;
        }
            
        case '|':
//            int a = 0; // error generated
            break;
    }
    
    return 0;
}


int main() {
    fun_01();
    return 0;
}


