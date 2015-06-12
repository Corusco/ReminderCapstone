//
//  CustomUIUtils.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/12/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//
#include <sys/xattr.h>
#import "UIPrefix.h"
#import <SystemConfiguration/SCNetworkReachability.h>
#import <netinet/in.h>
#import <QuartzCore/CoreAnimation.h>
#import <UIKit/UIKit.h>

#import "CustomUIUtils.h"

@implementation CustomUIUtils

#pragma mark - Messages

+ (void) messageAlert:(NSString*)msg title:(NSString*)title delegate:(id)delegate {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message: msg
                                                   delegate: delegate cancelButtonTitle: @"Ok" otherButtonTitles: nil];
    [alert show];
}


+ (void) conditionFailedMsg:(NSString*)condition filename:(NSString*)fname line:(int)line {
    NSString* str = [NSString stringWithFormat:@"Condition Failed (%@)\n\n%@\nLine No: %d", condition, fname, line];
    [CustomUIUtils messageAlert:str title:@"DebugError (Please report)" delegate:nil];
}

+ (void) printLog:(NSData*)data
{
    NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"==== \n %@ \n ====", str);
}

#pragma mark - Check for null value

+ (id) checkNull:(id)object {
    return [object isKindOfClass:[NSNull class]] ? @"" : object;
}



#pragma mark - Network Integrity

+ (BOOL) isConnectedToNetwork {
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    // synchronous model
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        NSLog(@"Error. Could not recover network reachability flags\n");
        return 0;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    //return (isReachable && !needsConnection) ? YES : NO;
    //BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
    
    return (isReachable && !needsConnection);
}


+ (void) networkFailureMessage {
    NSString *alertTitle = NSLocalizedString (@"Reach",@"Reach");
    NSString *msgText = @"Internet connection is not available. Please check your wifi settings.";
    
    [CustomUIUtils messageAlert:msgText title:alertTitle delegate:self];
}


+ (BOOL) checkNetworkConnection {
    if (![self isConnectedToNetwork])
    {
        [self networkFailureMessage];
        return NO;
    }
    return YES;
}

@end
