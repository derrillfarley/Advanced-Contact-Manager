//
//  TCCAppDelegate.h
//  Advanced Contact Manager
//
//  Created by Derrill Farley on 12/18/13.
//  Copyright (c) 2013 Trinity Creative Solutions, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ContactsPopover.h"

@interface TCCAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSToolbarItem *contactsToolbarButton;
@property (assign) ContactsPopover *contactsButtonPopover;
@property (assign) IBOutlet NSWindow *window;
@property (strong, nonatomic) NSArray *content;
//@property (assign) IBOutlet NSToolbarItem *contactsToolbarButton;
@property (assign) IBOutlet NSWindow *popoverWindow;

- (IBAction)contactsToolbarItemPressed:(id)sender;

@end
