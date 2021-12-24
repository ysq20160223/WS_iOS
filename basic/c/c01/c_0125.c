//
//  c_0125.c
//  
//
//  Created by sq y on 2017/6/29.
//
//

/*
    1, 变量的作用域 : 从定义的那一行开始, 一直到所在的代码块结束
    2，作用 : 及时回收不再使用的变量, 为了提升性能
 */

#include <stdio.h>

int main()
{
    int score = 1;
    {
        int score = 2;
        {
            score = 3;
        }
        printf("score = %d\n", score);
    }
    printf("---score = %d\n", score);
}


