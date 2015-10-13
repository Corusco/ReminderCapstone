//
//  ThemeQueryController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 9/30/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "ThemeQueryController.h"


@interface ThemeQueryController ()

@property (strong, nonatomic) NSArray *responseArray;
@property (strong, nonatomic) NSString *todaysDate;


@end

@implementation ThemeQueryController

- (void)getTodaysThemes {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate *defaultDate = [NSDate date];
    self.todaysDate = [dateFormatter stringFromDate:defaultDate];
    NSString *dummyDate = @"2015-10-02";
    
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.ourcavalcade.com/api/v1/index.php/"]];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *getString = [NSString stringWithFormat:@"todaysThemes/%@", dummyDate];
    
    [sessionManager GET:getString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.responseArray = [[NSArray alloc] initWithArray:responseObject];
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    if (self.responseArray.count > 0) {
        self.todayTheme = [[Theme alloc] initWithDictionary:self.responseArray[0]];
        self.yesterdayTheme = [[Theme alloc] initWithDictionary:self.responseArray[1]];
        self.dayBeforeTheme = [[Theme alloc] initWithDictionary:self.responseArray[2]];
        
        NSLog(@"Made it Through!");
    }
    
    
    
}



@end
