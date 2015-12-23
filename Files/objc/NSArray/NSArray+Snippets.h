//
//  NSArray+Snippets.h
//  Snippets
//
//  Created by Oleksii Baiev on 22/12/15.
//  Copyright © 2015 baevsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(Snippets)


// Remove NSNull values in a KVC generated NSMutableArray
//
// http://stackoverflow.com/questions/28547215/remove-nsnull-values-in-a-kvc-generated-nsmutablearray
//
//

- (NSArray*) arrayWithoutNils;


// Selection Sort
//
// https://gist.github.com/justinmpier/6789529
//
- (NSArray *)sortArray:(NSArray *)originalArray usingSelectionSortAlgorithmInDescendingOrder:(BOOL)descendingOrder;


@end
