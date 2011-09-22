//
//  Directory.m
//  CountingDirectories
//
//  Created by Steven Hepting on 11-08-29.
//  Copyright (c) 2011 Steven Hepting. All rights reserved.
//

#import "CDDirectory.h"

@implementation CDDirectory

@synthesize name;
@synthesize children;

-(id)init
{
    self = [super init];
    if (self) {
        children = [[NSMutableArray alloc] init];
        
        
    }
    return self;
}
-(id)initWithName:(NSString *)newName
{
    self = [self init];
    [self setName:newName];
    return self;
}

-(void)addChild:(CDDirectory *)dir
{
    [self.children addObject:dir];

}

@end
