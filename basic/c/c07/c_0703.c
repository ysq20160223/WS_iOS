//
//  c_0703.c
//  
//
//  Created by sq y on 2017/7/6.
//
//

/*
    01, 条件编译
    02, #if 最后必须加 #endif
 */

#include <stdio.h>

#define I 3


int main() {
    
#ifdef I
    printf("def\n");
#endif

    
#ifndef A
    printf("ndef\n");
#endif
    
    
#if (I == 1)
    {
        printf("I = %d\n", I);
    }
#elif (I == 2)
    {
        printf("I = %d\n", I);
    }
#else
    {
        printf("I = %d\n", I);
    }
#endif
    
    return 0;
}




