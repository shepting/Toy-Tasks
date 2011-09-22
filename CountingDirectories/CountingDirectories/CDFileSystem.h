//
//  CDFileSystem.h
//  CountingDirectories
//
//  Created by Steven Hepting on 11-08-31.
//  Copyright (c) 2011 Steven Hepting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDDirectory.h"

@interface CDFileSystem : NSObject


@property (nonatomic, strong) CDDirectory *rootDirectory;

-(NSInteger)addDirectory:(NSString *)fullDirectoryPath;
-(NSInteger)addDirectory:(NSArray *)directoryComponents toDirectory:(CDDirectory *)destDirectory;

@end
