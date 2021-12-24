//
//  c_0205.c
//  
//
//  Created by sq y on 2017/6/30.
//
//

/*
 
    01, 自增／自减
    02, 常量不能进行自增自减
 
 */

#include <stdio.h>

int main()
{
    int a = 10;
    
    int b = (a++) + (++a);
    
    printf("a: %d; b: %d\n", a, b);
    
    return 0;
}


