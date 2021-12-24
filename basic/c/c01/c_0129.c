//
//  c_0129.c
//  
//
//  Created by sq y on 2017/6/30.
//
//

/*
 
    1, scanf 函数只接收变量的地址, 否则会有不可预期结果
    2, scanf 函数时一个阻塞函数, 等待用户输入
    3, 用户输入完毕后, 就会将用户输入的值赋值给变量
 
    // 注意点
    4, 一次性输入多个数值, 并且以某些符合隔开
    5, 如果分隔符是空格, 实际输入可以输入 空格／tab／回车
    6, scanf 中不能写 \n
 
 */

#include <stdio.h>

int main()
{

    int number;
    
    printf("please input number: ");
    
    scanf("%d", &number);
    
    printf("number: %d\n", number);
    
    return 0;
}


