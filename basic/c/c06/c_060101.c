//
//  c_060101.c
//  
//
//  Created by Apple on 2017/7/2.
//
//

/*
    01, 定义 : 类型 数组名[元素个数]
 
    02, 赋值
        初始化直接赋值
        数组名[下标]
        
    03, 遍历
 
    04, 数组长度
 
    05, 内存存储
 
 */

#include <stdio.h>

void fun_01() {
    int count = 3;
    int ages[count]; // right 没有进行初始化
    
    // 赋值
    for (int i = 0; i < count; i++) {
        ages[i] = i * 2;
    }
    
    // 遍历输出
    for (int i = 0; i < count; i++) {
        printf("ages[%d]: %d\n", i, ages[i]);
    }
    printf("&ages: %p\n", &ages);
}

void fun_02() {
    int ages[] = {99, 88, 77};
    int count = sizeof(ages) / sizeof(int);
    for (int i = 0; i < count; i++) {
        printf("ages[%d]: %d\n", i, ages[i]);
    }
    printf("&ages: %p\n", &ages);
}

void fun_03() {
    char chars[] = {'a', 'B', 'c'};
    int count = sizeof(chars) / sizeof(char);
    
    for (int i = 0; i < count; i++) {
        printf("&chars[%d]: %p\n", i, &chars[i]);
    }
    printf("&chars: %p\n", &chars);
}

int main() {
    fun_01();
    printf("==========================\n");
    
    fun_02();
    printf("--------------------------\n");
    
    fun_03();
    
    return 0;
}


