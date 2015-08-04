//
//  GlobalPhotoQueryController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/23/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "GlobalPhotoQueryController.h"

@implementation GlobalPhotoQueryController

+ (instancetype)sharedInstance
{
    static GlobalPhotoQueryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GlobalPhotoQueryController alloc] init];
    });
                 
    return sharedInstance;
}


- (void)searchForInstagramPhotosWithTheme:(NSString *)theme {
    [APIServiceManager getWithClientID:@"/v1/tags/lifewontwait/media/recent" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.responseArray = responseObject[@"data"];
//        NSLog(@"Items returned by search: %lu", (unsigned long)[self.responseArray count]);
//        NSLog(@"%@", self.responseArray);
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:kInstagramSearchFinished object:self];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
