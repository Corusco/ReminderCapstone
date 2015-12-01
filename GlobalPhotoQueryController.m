//
//  GlobalPhotoQueryController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/23/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "GlobalPhotoQueryController.h"

@implementation GlobalPhotoQueryController


- (void)searchForInstagramPhotosWithTheme:(NSString *)theme {
    NSString *themeString = [NSString stringWithFormat:@"/v1/tags/%@/media/recent", theme];
    [APIServiceManager getWithClientID:themeString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.responseArray = responseObject[@"data"];
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:kInstagramSearchFinished object:self];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
