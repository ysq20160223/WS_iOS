//
//  c_060108.c
//  
//
//  Created by sq y on 2017/7/3.
//
//

/*
 
    01, 数组作为函数参数, 可以省略元素的个数
    02, 数组作为函数参数, 传递的是数组的地址
 
    03, 数组当作函数参数传递时, 会当做指针变量来使用, 指针变量占用八个字节
 
    04, 查找数组的最值
 
    05, 二维数组
 
 */

#include <stdio.h>

void print(int array[], int count) {
    for (int i = 0; i < count; i++) {
        printf("array[%d]: %d\n", i, array[i]);
    }
}

void change(int array[], int count) {
    for (int i = 0; i < count; i++) {
        array[i] = array[i] * 10;
    }
}

int main() {

    int ages[] = {0, 1, 2, 3, 4};
    
    int count = sizeof(ages) / sizeof(int);
    
    print(ages, count);
    
    change(ages, count);
    
    print(ages, count);
    
    return 0;
}




