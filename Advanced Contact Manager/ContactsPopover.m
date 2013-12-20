///////////////////////////////////////////////////////////////////////////
// TRINITY CREATIVE SOLUTIONS, LLC. CONFIDENTIAL
// __________________
//
//  [2007] - [2013] Trinity Creative Solutions, LLC
//  All Rights Reserved.
//
// NOTICE:  All information contained herein is, and remains
// the property of Trinity Creative Solutions, LLC and its suppliers,
// if any.  The intellectual and technical concepts contained
// herein are proprietary to Trinity Creative Solutions, LLC
// and its suppliers and may be covered by U.S. and Foreign Patents,
// patents in process, and are protected by trade secret or copyright law.
// Dissemination of this information or reproduction of this material
// is strictly forbidden unless prior written permission is obtained
// from Trinity Creative Solutions, LLC.
//
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
    NSLog(@"ContactsPopover::showPopup()");
}

- (IBAction)dismissButtonPressed:(id)sender {
    NSLog(@"Dismissing contacts popover");
    [popover close];
}

@end
