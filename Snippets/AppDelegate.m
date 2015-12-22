//
//  AppDelegate.m
//  Snippets
//
//  Created by Oleksii Baiev on 22/12/15.
//  Copyright © 2015 baevsoft. All rights reserved.
//

#import "AppDelegate.h"

#import "NSArray+Snippets.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSArray* arr = @[@1, [NSNull null], @1];
    arr = [arr arrayWithoutNils];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    
    
}

@end
