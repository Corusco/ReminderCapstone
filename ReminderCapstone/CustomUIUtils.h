//
//  CustomUIUtils.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/12/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomUIUtils : NSObject

+ (void) messageAlert: (NSString*)msg title: (NSString*)title delegate: (id)delegate;

+ (void) conditionFailedMsg:(NSString*)condition filename:(NSString*)fname line:(int)line;

+ (void) printLog:(NSData*)data;

+ (BOOL) isConnectedToNetwork;

+ (id) checkNull:(id)object;

+ (void) networkFailureMessage;

+ (BOOL) checkNetworkConnection;

@end
