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


// Selection Sort

- (NSArray *)sortArray:(NSArray *)originalArray usingSelectionSortAlgorithmInDescendingOrder:(BOOL)descendingOrder {
    for (NSUInteger i = 0; i < [originalArray count]; i++) {
        if (![[originalArray objectAtIndex:i] isKindOfClass:[NSNumber class]]) {
            [NSException raise:@"InvalidArrayException" format:@"InvalidArrayException"];
            return nil;
        }
    }
    
    NSMutableArray * array = [NSMutableArray arrayWithArray:originalArray];
    
    for (NSUInteger i = 0; i < [array count]; i++) {
        NSNumber * smallestOrBiggest = [array objectAtIndex:i];
        NSNumber * originalSmallestOrBiggest = smallestOrBiggest;
        NSUInteger foundInPosition;
        for (NSUInteger e = i; e < [array count]; e++) {
            NSNumber * numberAtE = [array objectAtIndex:e];
            NSComparisonResult comparison = descendingOrder ? NSOrderedAscending :
            NSOrderedDescending;
            if ([smallestOrBiggest compare:numberAtE] == comparison) {
                smallestOrBiggest = numberAtE;
                foundInPosition = e;
            }
        }
        if (smallestOrBiggest != originalSmallestOrBiggest) {
            [array replaceObjectAtIndex:i withObject:smallestOrBiggest];
            [array replaceObjectAtIndex:foundInPosition withObject:originalSmallestOrBiggest];
        }
    }
    
    return [NSArray arrayWithArray:array];
}

@end
