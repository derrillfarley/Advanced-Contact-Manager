//
//  ContactsPopover.m
//  Advanced Contact Manager
//
//  Created by Derrill Farley on 12/19/13.
//  Copyright (c) 2013 Trinity Creative Solutions, LLC. All rights reserved.
//

#import "ContactsPopover.h"

@implementation ContactsPopover

@synthesize popover;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)_makePopoverIfNeeded {
    if (popover == nil) {
        // Create and setup our window
        popover = [[NSPopover alloc] init];
        
        // The popover retains us and we retain the popover. We drop the popover whenever it is closed to avoid a cycle.
        popover.contentViewController = self;
        popover.behavior = NSPopoverBehaviorTransient;
        popover.delegate = self;
    }
}

- (void)showPopup:(NSView *)positioningView {
    [self _makePopoverIfNeeded];
    
    [popover showRelativeToRect:[positioningView bounds] ofView:positioningView preferredEdge:NSMinYEdge];
}

- (IBAction)dismissButtonPressed:(id)sender {
    NSLog(@"Dismissing contacts popover");
    [popover close];
}

@end
