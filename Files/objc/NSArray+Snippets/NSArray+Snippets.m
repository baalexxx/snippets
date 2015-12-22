//
//  NSArray+Snippets.m
//  Snippets
//
//  Created by Oleksii Baiev on 22/12/15.
//  Copyright © 2015 baevsoft. All rights reserved.
//

#import "NSArray+Snippets.h"

@implementation NSArray(Snippets)

- (NSArray*) arrayWithoutNils {
    
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF!=nil"];
    NSArray *res = [self filteredArrayUsingPredicate: predicate];
    
    return res;
}

@end
