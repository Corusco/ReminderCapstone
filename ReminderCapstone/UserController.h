//
//  UserController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/11/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Defines.h"
#import "WebLoginViewController.h"
#import "WebServiceManager.h"
#import "UIPrefix.h"
#import "CustomUIUtils.h"
#import "WebLoginViewController.h"

@interface UserController : NSObject

@property (strong, nonatomic) User *currentUser;

@property (strong, nonatomic) NSDictionary *userDictionary;

+ (instancetype)sharedInstance;

- (void) getUserInstagramWithAccessToken:(NSString*)accessToken completion:(void(^)(void))callback;

@end
