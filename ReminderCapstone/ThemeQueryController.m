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

+ (instancetype)sharedInstance {
    static ThemeQueryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ThemeQueryController alloc] init];
    });
    
    return sharedInstance;
}


- (void)getTodaysThemes {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate *defaultDate = [NSDate date];
    self.todaysDate = [dateFormatter stringFromDate:defaultDate];
    
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://box1096.bluehost.com/~ourcaval/api/v1/index.php"]];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *getString = [NSString stringWithFormat:@"todaysThemes/%@", self.todaysDate];
    
    [sessionManager GET:getString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.responseArray = [[NSArray alloc] initWithArray:responseObject];
        NSLog(@"%@", responseObject);
        [self assignThemes];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
}

- (void)assignThemes {
    if (self.responseArray.count > 0) {
        self.todayTheme = [[Theme alloc] initWithDictionary:self.responseArray[0][0]];
        self.yesterdayTheme = [[Theme alloc] initWithDictionary:self.responseArray[1][0]];
        self.dayBeforeTheme = [[Theme alloc] initWithDictionary:self.responseArray[2][0]];
        
        NSNotificationCenter *nc =  [NSNotificationCenter defaultCenter];
        [nc postNotificationName:kThemeQueryFinished object:self];
    }
}



@end
