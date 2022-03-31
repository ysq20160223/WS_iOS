//
//  c_060109.c
//  
//
//  Created by Apple on 2019/5/23.
//
//

/*
 功能1: 
    设计一个函数, 找出数组元素的最大值
 
 功能2:
    设计一个函数, 求数组前 N 个元素的和
 
 功能3:
    设计一个函数, 将数组倒序
 
 */
#include <stdio.h>
#include <string.h>

int getMax(int array[], int count) {
    int tmp = array[0];
    for (int i = 1; i < count; i++) {
        if (tmp < array[i]) {
            tmp = array[i];
        }
    }
    return tmp;
}

int getSum(char array[]) {
    int sum = 0;
    for (int i = 0; i < strlen(array); i++) {
        sum += array[i];
    }
    return sum;
}


//
void changeValue(char array[], int a, int b) {
    int tmp = array[a];
    array[a] = array[b];
    array[b] = tmp;
}

void reverse(char array[]) {
    for (int i = 0; i <= strlen(array) / 2; i++) {
        changeValue(array, i, strlen(array) - 1 - i);
    }
}

void printArray(char array[]) {
    for (int i = 0; i < strlen(array); i++) {
        printf("%c", array[i]);
    }
    printf("\n");
}


int main() {
    
    int intArray[] = {1, 21, 3, 9, 30};
    printf("max: %d\n", getMax(intArray, sizeof(intArray) / sizeof(int)));
    printf("==================\n");
    
    
    char charArray[] = {'A', 'B', 'C'}; // 65 66 67
    printf("sum: %d\n", getSum(charArray));
    printf("==================\n");
    
    
    reverse(charArray);
    printArray(charArray);

    return 0;
}


