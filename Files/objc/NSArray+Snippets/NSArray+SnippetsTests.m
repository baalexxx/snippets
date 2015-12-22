//
//  NSArray+SnippetsTests.m
//  Snippets
//
//  Created by Oleksii Baiev on 22/12/15.
//  Copyright © 2015 baevsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Snippets.h"

@interface NSArray_SnippetsTests : XCTestCase

@end

@implementation NSArray_SnippetsTests

- (void)testRemovingNil {
    
    NSArray* arr = @[@"1", [NSNull null], @"1"];
    NSArray* res = [arr arrayWithoutNils];
    
    XCTAssertTrue([arr containsObject:[NSNull null]]);
    XCTAssertFalse([res containsObject:[NSNull null]]);
}

@end
