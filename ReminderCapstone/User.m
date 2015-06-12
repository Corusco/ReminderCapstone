//
//  User.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/11/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "User.h"
#import "CustomUIUtils.h"

@implementation User

- (id)initWithDictionaryInstagram:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.instagramUserName = [CustomUIUtils checkNull:[dictionary objectForKey:@"username"]];
        self.instagramProfilePhotoURL = [CustomUIUtils checkNull:[dictionary objectForKey:@"profile_picture"]];
        self.instagramUserID = [[CustomUIUtils checkNull:[dictionary objectForKey:@"id"]] intValue];
    }
    return self;
}

@end
