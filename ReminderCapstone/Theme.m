//
//  Theme.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/9/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "Theme.h"

@implementation Theme

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    self.themeTitle = dictionary[@"ThemeTitle"];
    self.themeHash = dictionary[@"ThemeHash"];
    
    return self;
}

@end