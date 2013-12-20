//
//  ContactsPopover.h
//  Advanced Contact Manager
//
//  Created by Derrill Farley on 12/19/13.
//  Copyright (c) 2013 Trinity Creative Solutions, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactsPopover : NSViewController <NSPopoverDelegate> {
    NSPopover *popover;
}

@property NSPopover *popover;

- (IBAction)dismissButtonPressed:(id)sender;
- (void)showPopup:(NSView *)positioningView;

@end