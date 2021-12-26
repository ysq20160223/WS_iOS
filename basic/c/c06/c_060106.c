//
//  c_060106.c
//  
//
//  Created by Apple on 2019/5/23.
//
//

#include <stdio.h>


int main() {

    //
    int ages[] = {1, 21, 30};
    
    printf("ages: %p\n", ages);
    
    int ageSize = sizeof(ages) / sizeof(int);
    for (int i = 0; i < ageSize; i++) {
        printf("&ages[%d]: %p\n", i, &ages[i]);
    }
    
    printf("==================\n");
    
    //
    int count = 5;
    char ids[count]; // 若定义的时候初始化则 [] 内不能为变量
    for (int i = 0; i < count; i++) {
        ids[i] = 'A' + i;
    }
    for (int i = 0; i < count; i++) {
        printf("&ids[%d]: %p\n", i, &ids[i]);
    }
    
}


