//
//  ThemeQueryController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 9/30/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "Theme.h"
#import "Defines.h"


@interface ThemeQueryController : NSObject

@property (strong, nonatomic) Theme *todayTheme;
@property (strong, nonatomic) Theme *yesterdayTheme;
@property (strong, nonatomic) Theme *dayBeforeTheme;

+ (instancetype)sharedInstance;

- (void)getTodaysThemes;

@end
