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
//  ContactsPopover.h
//  Advanced Contact Manager
//
//  Created by Derrill Farley on 12/19/13.
//  Copyright (c) 2013 Trinity Creative Solutions, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactsPopover : NSViewController <NSPopoverDelegate>

@property NSPopover *popover;

- (IBAction)dismissButtonPressed:(id)sender;
- (void)showPopup:(NSView *)positioningView;

@end