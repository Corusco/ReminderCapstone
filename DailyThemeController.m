//
//  DailyThemeController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 8/4/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "DailyThemeController.h"

@implementation DailyThemeController

+ (instancetype)sharedInstance {
    static DailyThemeController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DailyThemeController alloc] init];
    });
    
    return sharedInstance;
}

- (void)getAllThemes {
    [APIServiceManager getThemeWithParameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.responseArray = responseObject;
        NSLog(@"Themes: %@", responseObject);
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:kThemesLoadFinished object:self];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
    
}

- (void)getTodaysTheme{
    
}

- (void)getThemeWithDate:(NSDate *)date{
    
}

@end
