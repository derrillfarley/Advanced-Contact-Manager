//
//  TCCPeoplePickerController.h
//  Advanced Contact Manager
//
//  Created by Derrill Farley on 12/20/13.
//  Copyright (c) 2013 Trinity Creative Solutions, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/ABPeoplePickerView.h>
#import <AddressBook/ABPersonView.h>

@interface TCCPeoplePickerController : NSObject {
    IBOutlet ABPeoplePickerView *peoplePickerView;
    IBOutlet ABPersonView *personView;
}

@end
