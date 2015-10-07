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


@interface ThemeQueryController : NSObject

@property (strong, nonatomic) NSString *todayTheme;
@property (strong, nonatomic) NSString *yesterdayTheme;
@property (strong, nonatomic) NSString *dayBeforeTheme;

- (void)getTodayTheme;

@end
