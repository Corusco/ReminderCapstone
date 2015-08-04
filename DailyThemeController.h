//
//  DailyThemeController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 8/4/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defines.h"
#import "APIServiceManager.h"
#import "Theme.h"

@interface DailyThemeController : NSObject

@property (strong, nonatomic) NSArray *responseArray;
@property (strong, nonatomic) NSArray *themeArray;

+ (instancetype)sharedInstance;

- (void)getAllThemes;

- (void)getTodaysTheme;

- (void)getThemeWithDate:(NSDate *)date;

@end
