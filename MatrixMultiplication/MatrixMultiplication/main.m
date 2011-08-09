//
//  main.m
//  MatrixMultiplication
//
//  Created by Steven Hepting on 11-08-08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//  Multiplying matrices:
//
//  |2 3|   |2 3 4|     |13 18 23|
//  |3 4| x |3 4 5|  =  |18 25 32|
//  |4 5|               |23 32 41|
//


#import <Foundation/Foundation.h>


#define first_height 3
#define first_width 2
#define second_height 2 
#define second_width 3

int **multiply(int **first, int **second);
void printArray(int **array, int x, int y); 

int **multiply(int **first, int **second)
{   
    // Prepare the destination matrix
    int **dest;
    dest = (int **)malloc(sizeof(int *) * first_height);
    
    for (int n=0;n<first_height;++n){
        dest[n] = (int *)malloc(sizeof(int) * second_width);
    }
    
    int sum;
    
    // Sum multiples
    for (int i=0;i<second_width;i++){
        for (int j=0;j<first_height;j++){
            // Sum
            sum = 0;
            for (int k=0;k<first_width;++k){
                sum += first[i][k] * second[k][j];
            }
            //printf("Sum: %i\n", sum);
            dest[i][j] = sum;
        }
    }   
    return dest;
}

void printArray(int **array, int x, int y) 
{
    for (int i=0;i<y;++i){
        for (int j=0;j<x;++j){
            printf(" %i", array[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}


int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Populate first
        int **first = (int **)malloc(sizeof(int *)*first_height);
        for (int i=0;i<first_height;++i){
            first[i] = (int *)malloc(sizeof(int)*first_width);
        }
        first[0][0] = 2; first[0][1] = 3;
        first[1][0] = 3; first[1][1] = 4;
        first[2][0] = 4; first[2][1] = 5;
        
        // Populate second
        int **second = (int **)malloc(sizeof(int *)*second_height);
        for (int i=0;i<second_height;++i){
            second[i] = (int *)malloc(sizeof(int)*second_width);
        }
        second[0][0] = 2; second[0][1] = 3; second[0][2] = 4;
        second[1][0] = 3; second[1][1] = 4; second[1][2] = 5;
        
        printf("First matrix:\n");
        printArray(first, first_width, first_height);
        printf("Second matrix:\n");
        printArray(second, second_width, second_height);
        printf("Final matrix:\n");
        printArray(multiply(first, second), first_height, second_width);
        
    }
    return 0;
}

