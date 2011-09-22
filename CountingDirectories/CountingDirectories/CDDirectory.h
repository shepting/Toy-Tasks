//
//  Directory.h
//  CountingDirectories
//
//  Created by Steven Hepting on 11-08-29.
//  Copyright (c) 2011 Steven Hepting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDDirectory : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *children;

-(id)initWithName:(NSString *)newName;
-(void)addChild:(CDDirectory *)dir;

@end
