//
//  AppController.m
//  Advanced Contact Manager
//
//  Created by Derrill Farley on 12/18/13.
//  Copyright (c) 2013 Trinity Creative Solutions, LLC. All rights reserved.
//

#import "AppController.h"

@implementation AppController

-(void) awakeFromNib {
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSString *stringFromDate = [formatter stringFromDate:currentTime];
    
    //    [self updateTimerLabel: stringFromDate ];
    NSLog(@"awakeFromNib: %@", stringFromDate);
    
}

@end
