//
//  c_060410.c
//  
//
//  Created by Apple on 2017/7/6.
//
//

/*
    01, 枚举类型 (只允许固定取值)
 
    02, enmu
 
    03, 数据类型
        基本数据类型
            int / long / short / unsigned 输出 : %zd / signed
            float / double
            char
 
        构造类型
            数组 : 只能由同一类型的数据组成
            结构体 : 可以由不同类型数据组成
 
        指针类型
 
        枚举类型
 
 
 */

#include <stdio.h>

enum Season
{
    spring = 5, // 一般不会改值
    summer,
    autumn,
    winter
};

int main()
{
    enum Season s = winter;
    
    printf("s = %u\n", s);

    return 0;
}


