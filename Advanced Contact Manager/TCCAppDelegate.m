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
//  TCCAppDelegate.m
//  Advanced Contact Manager
//
//  Created by Derrill Farley on 12/18/13.
//  Copyright (c) 2013 Trinity Creative Solutions, LLC. All rights reserved.
//

#import "TCCAppDelegate.h"

#import <EvernoteSDK-Mac/EvernoteSDK.h>

@implementation TCCAppDelegate

@synthesize window = _window;
@synthesize content;
@synthesize contactsToolbarButton = _contactsToolbarButton;
//@synthesize contactsButtonPopover;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    // Sandbox Evernote service
    NSString *EVERNOTE_HOST = BootstrapServerBaseURLStringSandbox;
    
    // Production Evernote service
//    NSString *EVERNOTE_HOST = BootstrapServerBaseURLStringUS;
    
    // Evernote session info...
    NSString *CONSUMER_KEY = @"derrill-farley";
    NSString *CONSUMER_SECRET = @"c9a576fcd647e92a";
    
    // set up Evernote session singleton
    [EvernoteSession setSharedSessionHost:EVERNOTE_HOST
                              consumerKey:CONSUMER_KEY
                           consumerSecret:CONSUMER_SECRET];
    
    NSLog(@"applicationDidFinishLaunching: \n\tEvernote SharedSession\n\t\tHost: %@\n\t\tConsumer Key: %@\n\t\tConsumer Secret:%@",
          EVERNOTE_HOST, CONSUMER_KEY, CONSUMER_SECRET);
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

-(void) awakeFromNib {
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSString *stringFromDate = [formatter stringFromDate:currentTime];
    NSWindow *myWindow = [self window];
    NSButton *button = (NSButton *)[[self contactsToolbarButton] view];
    
    NSLog(@"awakeFromNib: %@", stringFromDate);
    NSLog(@"awakeFromNib: window=%@", myWindow);
    NSLog(@"awakeFromNib: contactsToolbarButton=%@", button);
    
//    NSString* imageName = [[NSBundle mainBundle] pathForResource:@"contacts-icon32" ofType:@"png"];
//    NSImage* imageObj = [[NSImage alloc] initWithContentsOfFile:imageName];
//    
//    NSButton *newButton = [[NSButton alloc]init];
////    [button setImage:[NSImage imageNamed:@"contacts-icon32"]];
//    [button setImage:imageObj];
//    [button setAlternateImage:[NSImage imageNamed:@"contacts-icon32"]];
//    [button setImagePosition:NSImageOnly];
//    [button setBordered:NO];
//    
//    [self.contactsToolbarButton setView:newButton];
//    
//    button = (NSButton *)[[self contactsToolbarButton] view];
//    NSLog(@"awakeFromNib: contactsToolbarButton=%@", button);
}

- (IBAction)doAuthenticate:(id)sender {
    EvernoteSession *session = [EvernoteSession sharedSession];
    NSLog(@"Session %@", session);
    [session authenticateWithWindow:self.window completionHandler:^(NSError *error) {
        if (error || !session.isAuthenticated) {
            NSRunCriticalAlertPanel(@"Error", @"Could not authenticate", @"OK", nil, nil);
        }
        else {
            NSLog(@"authenticated! noteStoreUrl:%@ webApiUrlPrefix:%@", session.noteStoreUrl, session.webApiUrlPrefix);
            
            EvernoteNoteStore *noteStore = [EvernoteNoteStore noteStore];
            [noteStore listNotebooksWithSuccess:^(NSArray *notebooks) {
                self.content = notebooks;
                NSLog(@"notebooks: %@", notebooks);
            } failure:^(NSError *error2) {
                NSLog(@"error %@", error2);
            }];
        }
    }];
}

- (IBAction)contactsToolbarItemPressed:(id)sender {
    NSLog(@"Showing contacts popover");
    
    NSButton *button = (NSButton *)[[self contactsToolbarButton] view];
    NSLog(@"Showing contacts popover with view: %@", button);
    
    if (!contactsButtonPopover) {
        //[[SomeObject alloc] init];
        contactsButtonPopover = [[ContactsPopover alloc] initWithNibName:@"ContactsPopover" bundle:Nil];
//        [self setContactsButtonPopover: po];
    }
    
    [contactsButtonPopover showPopup:button];
}

@end
