//
//  NSArray+Snippets.h
//  Snippets
//
//  Created by Oleksii Baiev on 22/12/15.
//  Copyright © 2015 baevsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(Snippets)

// http://stackoverflow.com/questions/28547215/remove-nsnull-values-in-a-kvc-generated-nsmutablearray
//
// Remove NSNull values in a KVC generated NSMutableArray
//

- (NSArray*) arrayWithoutNils;


@end
