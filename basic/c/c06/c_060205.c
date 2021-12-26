//
//  c_060205.c
//  
//
//  Created by Apple on 2017/7/3.
//
//

/*
 
    01, 可读性 - 性能 - 精简
 
    02, 字符串数组
 
 */

#include <stdio.h>
#include <string.h>

// 判断字符串是否包含某个字符: 常用方式
int charContain_01(char chars[], char c)
{
    for (int i = 0; i < strlen(chars); i++) {
        if (chars[i] == c) {
            return 1;
        }
    }
    return 0;
}

int charContain_02(char chars[], char c)
{
    for (int i = 0; chars[i]; i++) {
        if (chars[i] == c) {
            return 1;
        }
    }
    return 0;
}

int charContain_03(char chars[], char c)
{
    int i = 0;
    
    for (; (chars[i] != c) && (chars[i] != '\0') ; i++);
    
    return chars[i] != 0;
}

void stringArray()
{
    char names[][] = {"jim", "green"};
    
    printf("names[1] = %s\n", names[1]);
    printf("name[0][2] = %c\n", names[0][2]);
}

int main()
{
//    printf("charContain_01 = %d\n", charContain_01("itok", '2'));
//    printf("charContain_02 = %d\n", charContain_02("itok", '1'));
//    printf("charContain_03 = %d\n", charContain_03("itok", '1'));
    
    stringArray();
    
    return 0;
}


