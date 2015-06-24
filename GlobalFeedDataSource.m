//
//  GlobalFeedDataSource.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/23/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "GlobalFeedDataSource.h"

@implementation GlobalFeedDataSource

+ (instancetype)sharedInstance
{
    static GlobalFeedDataSource *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GlobalFeedDataSource alloc] init];
    });
                 
    return sharedInstance;
}


- (void)searchForInstagramPhotosWithTheme:(NSString *)theme {
    [APIServiceManager getWithClientID:@"/v1/tags/lifewontwait/media/recent" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
