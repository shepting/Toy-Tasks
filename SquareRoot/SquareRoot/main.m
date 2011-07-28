//
//  main.m
//  SquareRoot
//
//  Created by Steven Hepting on 11-07-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "header.h"

#define ACCURACY .1

float root_helper(float low, float high, float n){
    float midPoint = (low + high)/2;
    float midSquared = midPoint*midPoint;
    printf("Checking %f %f %f %f\n", low, high, midPoint, midSquared);

    // Check if it's close enough
    if ((midSquared < (n + ACCURACY)) &&
        (midSquared > (n - ACCURACY))){
        return midPoint;
    } else if (midSquared > n){ 
        // The choice was too high
        // Try again with a new highest point
        return root_helper(low, midPoint, n);
    } else if (midSquared < n){
        // The choice was too low,
        // try again with a new lowest point
        return root_helper(midPoint, high, n);
    }
    else return -1;
}

float root(float number){
    return root_helper(1, number, number);
}

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        float startingNumber = 23834;
        float squareRoot = root(startingNumber);
        NSLog(@"Square root of %f: %f", startingNumber, squareRoot);
        // insert code here...
//        NSLog(@"Hello, World!");
        
    }
    return 0;
}

