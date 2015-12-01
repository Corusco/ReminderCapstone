//
//  User.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/11/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *loginName;
@property (strong, nonatomic) NSString *fullName;
@property (strong, nonatomic) NSString *instagramUserName;
@property (strong, nonatomic) NSString *instagramAccessToken;
@property (strong, nonatomic) NSString *instagramProfilePhotoURL;
@property (assign, nonatomic) BOOL loggedInInstagram;
@property (assign, nonatomic) int instagramUserID;


- (id)initWithDictionaryInstagram:(NSDictionary *)dictionary;

@end
