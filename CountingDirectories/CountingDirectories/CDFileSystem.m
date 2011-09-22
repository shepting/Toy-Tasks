//
//  CDFileSystem.m
//  CountingDirectories
//
//  Created by Steven Hepting on 11-08-31.
//  Copyright (c) 2011 Steven Hepting. All rights reserved.
//

#import "CDFileSystem.h"

@implementation CDFileSystem

@synthesize rootDirectory;

-(id)init
{
    self = [super init];
    if (self) {
        rootDirectory = [[CDDirectory alloc] initWithName:@"root"];
    }
    return self;
}


-(NSInteger)addDirectory:(NSString *)fullDirectoryPath 
{
    NSString *cleanedDir = [fullDirectoryPath substringFromIndex:1]; 
    NSArray *components = [cleanedDir componentsSeparatedByString:@"/"];
    
    return [self addDirectory:components toDirectory:self.rootDirectory];
}

// Look at all of the directory names at this level (all root children if nil)
// If the first component (the directory name we will create if it doesn't exist) doesn't 
// match any of the children of destDirectory then we create it and add it as a child to
// the destDirectory
// Then, I imagine that we can call back to ourself with one less component and our new directory
-(NSInteger)addDirectory:(NSArray *)directoryComponents toDirectory:(CDDirectory *)destDirectory
{
    NSString *currNewDirName = [directoryComponents objectAtIndex:0];
    NSInteger newDirsCreated = 0;
    
    // Either find the directory that matches, or create a new directory
    CDDirectory *matchedDirectory = nil;
    for (CDDirectory *child in destDirectory.children) {
        if ([child.name isEqualToString:currNewDirName]) {
            matchedDirectory = child;
        }
    }
    if (matchedDirectory == nil) {
        // Since we didn't find a match, create the new dir, note it, and add as child
        matchedDirectory = [[CDDirectory alloc] initWithName:currNewDirName];
        newDirsCreated = 1;
        
        [destDirectory addChild:matchedDirectory];
    }
    
    // Recurse
    NSRange allButFirst = NSMakeRange(1, [directoryComponents count]-1);
    NSArray *reducedArray = [directoryComponents subarrayWithRange:allButFirst];
    if ([reducedArray count]) {
        newDirsCreated += [self addDirectory:reducedArray toDirectory:matchedDirectory];
    }
    
    return newDirsCreated;
    
}


@end
