//
//  c_0206.c
//  
//
//  Created by Apple on 2019/5/12.
//
//

#include <stdio.h>

int main() {

    int a = 1;
    
    int b = (a++) + (++a);
    
    printf("a = %d, b = %d\n", a, b);
    
    return 0;
}
