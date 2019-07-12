//
//  c_0520.c
//  
//
//  Created by Apple on 2019/5/20.
//
//


/*
 功能: 输出二进制数
 */

#include <stdio.h>


void printBinary(int n) {
    int count = (sizeof n) * 8;
//    printf("count: %d\n", count);
    
    for (int i = count - 1; i >= 0; i--) {
        int temp = n >> i & 1;
       
        printf("%d", temp);
        if (0 == i % 4) {
            printf("%c", ' ');
        }
        if (0 == i % 8) {
            printf("%s", "   ");
        }
    }
    printf("\n");
    
}

int main() {

    printBinary(21);
    
    printBinary('1');

    return 0;
}


