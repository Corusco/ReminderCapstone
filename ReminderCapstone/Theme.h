//
//  Theme.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/9/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Theme : NSObject

@property (strong, nonatomic) NSString *themeTitle;
@property (strong, nonatomic) NSString *themeHash;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end