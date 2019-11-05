//
//  c_0108.c
//
//
//  Created by sq y on 2017/6/29.
//
//

/*
 03_C_语言 -> 01_基础语法 -> 08_第二个C程序
 
 1, 显示行号 :  Xcode - Preferences - Text Edit - Editing - Show - Line Numbers
 2, 编译 + 运行 : cc 文件名.c
 3, 标识符 : 字母/数字／下划线 (不能以数字开头)
 
 */

#include <stdio.h>

int print()
{
    printf("*******\n");
    return 0;
}

int main()
{
    print();
    printf("** c **\n");
    print();
    return 0;
}
