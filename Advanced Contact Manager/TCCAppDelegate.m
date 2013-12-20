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
@synthesize contactsButtonPopover;
@synthesize popoverWindow;
@synthesize contactsToolbarButton;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    // Override point for customization after application launch.
    
    // Initial development is done on the sandbox service
    // Change this to BootstrapServerBaseURLStringUS to use the production Evernote service
    // Change this to BootstrapServerBaseURLStringCN to use the Yinxiang Biji production service
    // BootstrapServerBaseURLStringSandbox does not support the  Yinxiang Biji service
    NSString *EVERNOTE_HOST = BootstrapServerBaseURLStringSandbox;
    
    // Fill in the consumer key and secret with the values that you received from Evernote
    // To get an API key, visit http://dev.evernote.com/documentation/cloud/
    NSString *CONSUMER_KEY = @"derrill-farley";
    NSString *CONSUMER_SECRET = @"c9a576fcd647e92a";
    
    // set up Evernote session singleton
    [EvernoteSession setSharedSessionHost:EVERNOTE_HOST
                              consumerKey:CONSUMER_KEY
                           consumerSecret:CONSUMER_SECRET];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

-(void) awakeFromNib {
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSString *stringFromDate = [formatter stringFromDate:currentTime];
    
    //    [self updateTimerLabel: stringFromDate ];
    NSLog(@"awakeFromNib: %@", stringFromDate);
    
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

- (IBAction)contactsToolbarItemPressed:(id)sender
{
    NSLog(@"showing contacts popover");
    
    NSButton *button = (NSButton *)[contactsToolbarButton view];
    [self showContactsPopup:button];
}

- (void)showContactsPopup:(NSView *)positioningView {
    [contactsButtonPopover showRelativeToRect:[positioningView bounds] ofView:positioningView preferredEdge:NSMinYEdge];
    
}

@end
