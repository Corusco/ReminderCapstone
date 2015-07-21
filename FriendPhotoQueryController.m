//
//  FriendFeedDataSource.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/23/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "FriendPhotoQueryController.h"

@implementation FriendPhotoQueryController

+ (instancetype)sharedInstance
{
    static FriendPhotoQueryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FriendPhotoQueryController alloc] init];
    });
    
    return sharedInstance;
}


- (void)searchForInstagramPhotosWithTheme:(NSString *)theme {
    [APIServiceManager getWithAccessToken:@"/v1/users/self/feed" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.responseArray = responseObject[@"data"];
        NSLog(@"Items returned by search: %lu", (unsigned long)[self.responseArray count]);
//        NSLog(@"%@", self.responseArray);
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:kInstagramSearchFinished object:self];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}


@end
