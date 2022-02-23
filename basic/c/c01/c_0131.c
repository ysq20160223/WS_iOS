//
//  c_0131.c
//  
//
//  Created by Apple on 2019/5/11.
//
//

/*
    note: scanf 中不能写 \n
 */
#include <stdio.h>


int main() {

    int a, b;
    
    printf("please input two number(a b): ");
    scanf("%d %d", &a, &b); // 参数中以空格隔开, 实际输入可以以 空格/tab/回车 作为分隔符
    
    printf("a: %d; b: %d\n", a, b);
    
    return 0;
}


