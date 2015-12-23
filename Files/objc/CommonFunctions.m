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




