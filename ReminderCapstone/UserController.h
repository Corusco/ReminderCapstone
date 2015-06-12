//
//  UserController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/11/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserController : NSObject

+ (instancetype)sharedInstance;

- (void) getUserInstagramWithAccessToken:(NSString*)accessToken completion:(void(^)(void))callback;

@end
