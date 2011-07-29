//
//  main.m
//  TestingRandom
//
//  Created by Steven Hepting on 11-07-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NUM_TESTS 10000
#define MAX_NUM 100
#define foo4random() (arc4random() % ((unsigned)RAND_MAX + 1))

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        int generatedNumbers[NUM_TESTS];
        malloc(sizeof(int));
        NSMutableDictionary *valuesDict = [[NSMutableDictionary alloc] init ];
        for (int i=0;i<MAX_NUM;++i){
            [valuesDict setValue:[NSNumber numberWithInt:0] forKey:[NSString stringWithFormat:@"%i", i]];
        }
        
        for (int i=0;i<NUM_TESTS;++i){
            int number = (arc4random() % ((unsigned)MAX_NUM + 1));
            generatedNumbers[i] = number;
            NSString *key = [NSString stringWithFormat:@"%i", number];
            int prev_num = (int)[[valuesDict valueForKey:key] integerValue];
            [valuesDict setValue:[NSNumber numberWithInt:prev_num+1] forKey:key];
            //NSLog(@"  %i", generatedNumbers[i]);
        }
        
        [valuesDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(@"Key: %@  Value: %@", key, obj);
        }];
        
        
        // insert code here...
        NSLog(@"Hello, World!");
        
    }
    return 0;
}

