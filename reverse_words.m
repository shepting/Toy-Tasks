#import <Foundation/Foundation.h>


// Open a file and return its contents
NSEnumerator * ReadFile()
{
    NSString *path = @"input.txt";
    NSError *error;
    NSString *stringFromFileAtPath = [[NSString alloc] initWithContentsOfFile:path       
        encoding:NSUTF8StringEncoding error:&error];
    if (stringFromFileAtPath == nil)
        NSLog(@"Error reading file at %@\n%@", path, [error localizedFailureReason]);
    NSArray *lines = [stringFromFileAtPath componentsSeparatedByString:@"\n"];
    NSEnumerator *enumerator = [lines objectEnumerator];
    [enumerator nextObject];
    return enumerator;
}

// Use tail recursion
void PrintReverse(NSArray *words, int index)
{    
    if (index < [words count] - 1)
        PrintReverse(words, index + 1);
    printf("%s ", [[words objectAtIndex:index] UTF8String]);
}

// Main program
int main(int argc, const char* argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // int count = 0;
    // 
    for (NSString *line in ReadFile()){

        NSArray * words = [line componentsSeparatedByString:@" "];
        PrintReverse(words, 0);
        printf("\n");
    }
    //     NSArray * words = [line componentsSeparatedByString:@" "];
    //     NSMutableString *newString = [NSMutableString string];
    //     if (count > 0)
    //     {
    //         for (id element in [words reverseObjectEnumerator]){
    //                 [newString appendFormat:@"%@ ", element];
    //         }
    // 
    //         printf("Case #%i: %s\n", count, [newString UTF8String]);
    //     }
    //     count += 1;
    // }
        
    [pool release];
    return 0;
}