//
//  CommonFunctions.m
//  Snippets
//
//  Created by Alex Baev on 23/12/15.
//  Copyright © 2015 baevsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

// call stack in console

NSLog(@"%@",[NSThread callStackSymbols]);



// MyLog

void MyLog(NSString *format, ...){
    va_list args;
    va_start(args, format);
    NSLogv(format, args);
    va_end(args);
}



/*

 http://spitzkoff.com/craig/
 
Const CGRect in Objective C
File this under something I just learned from one of our vendors; you can declare const structs like a CGRect in your implementation like this:
 
 */

const CGRect kPlaceholderFrame1 = {
    .origin.x = 126.0f,
    .origin.y = 22.0f,
    .size.width = 180.0f,
    .size.height = 100.0f
};

/*
 
OSX utility to convert a plist to json
Here’s a new utility  for OSX Lion I threw together to convert a plist file to a JSON file.

It takes a single argument, which is an absolute or relative path to a plist file. The output of this application will be a JSON file written in the same directory of the plist.

Grab the source from github, or download the binary here
Its an extremely simple tool; it basically relies on NSJSONSerialzation to generate the JSON, and NSDictionary native support for plists to read in the original data. 2 lines of code to do the actual conversion, plus file writing and error handling.
Here’s the entire application’s code:
 
*/


int main (int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        if(argc < 2)
        {
            printf("Not enough arguments; missing plist file.\n");
            return 1;
        }
        
        NSFileManager *filemgr;
        NSString *currentpath;
        
        filemgr = [[NSFileManager alloc] init];
        
        currentpath = [filemgr currentDirectoryPath];
        
        // try to find the full path to the spcified file.
        NSString* path = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
        if(![filemgr fileExistsAtPath:path])
        {
            // path was not absolute or did not exist. Try looking in the current path.
            path = [currentpath stringByAppendingPathComponent:path];
            
            if(![filemgr fileExistsAtPath:path])
            {
                printf("Could not find file %s\n", argv[1]);
                return 1;
            }
        }
        
        NSDictionary* dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
        if (nil == dictionary) {
            printf("Could not parse plist file %s\n", argv[1]);
            return 1;
        }
        
        NSError* error = nil;
        
        NSData* data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
        
        if(nil == data)
        {
            NSString* errorMessage = [NSString stringWithFormat:@"There was an error converting to JSON: %@", error];
            printf("%s", [errorMessage cStringUsingEncoding:NSUTF8StringEncoding]);
            return 1;
        }
        
        path = [path stringByAppendingPathExtension:@"json"];
        
        if (![data writeToFile:path atomically:YES]) {
            printf("Error writing to file: %s", [path cStringUsingEncoding:NSUTF8StringEncoding]);
            return 1;
        }
        
    }
    return 0;
}



