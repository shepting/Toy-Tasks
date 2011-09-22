//
//  main.m
//  CountingDirectories
//
//  Created by Steven Hepting on 11-08-10.
//  Copyright (c) 2011 Steven Hepting. All rights reserved.
//
// http://code.google.com/codejam/contest/dashboard?c=635101
//
// Essentially, we have a tree with infinite children for each node.
// We build the tree in the first step seeing which directories 
// already exist. In the next step, we look at the new ones and add
// the ones still needed.
//

#import <Foundation/Foundation.h>
#import "CDDirectory.h"
#import "CDFileSystem.h"

NSUInteger calculateRequired(NSArray *existing, NSArray *toCreate);

// Find how many directories are required to be created for this particular test
// case (array of existing and array of new directories).
NSUInteger calculateRequired(NSMutableArray *existing, NSMutableArray *toCreate)
{
    CDFileSystem *fs = [[CDFileSystem alloc] init];
    
    NSInteger numCreated;
    for (NSString *fullPath in existing) {
        [fs addDirectory:fullPath];
    }
    
    for (NSString *fullPath in toCreate) {
        numCreated += [fs addDirectory:fullPath];
    }
    
    return numCreated;
}

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"input" ofType:@"txt"];
        
        NSError *error;
        NSString *fileContents = [NSString stringWithContentsOfFile:path
                                  encoding:NSUTF8StringEncoding error:&error];
        if (!fileContents){
            NSLog(@"Error: %@", [error description]);
        }
        
        NSArray *lines = [fileContents componentsSeparatedByString:@"\n"];
        NSEnumerator *en = [lines objectEnumerator];
        
        NSString *testsStr = [en nextObject];
        NSInteger numTests = [testsStr integerValue];
        
        for (int i=0;i<numTests;++i){
            NSArray * values = [[en nextObject] componentsSeparatedByString:@" "];
            NSInteger numExisting = [[values objectAtIndex:0] integerValue];
            NSInteger numToCreate = [[values objectAtIndex:1] integerValue];
            NSMutableArray *existing = [[NSMutableArray alloc] init];
            NSMutableArray *toCreate = [[NSMutableArray alloc] init];;

            for (int j=0;j<numExisting;++j){
                [existing addObject:[en nextObject]];
            }
            for (int k=0;k<numToCreate;++k){
                [toCreate addObject:[en nextObject]];
            }

            NSInteger required = calculateRequired(existing, toCreate);
            NSString *formattedResults = [NSString stringWithFormat:@"Test #%i: %ld", i+1, required];
            printf("%s\n", [formattedResults UTF8String]);
        }


        
    }
    return 0;
}

