//
//  photoQueryResult.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/23/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Defines.h"

@interface PhotoQueryResult : NSObject

@property (strong, nonatomic) NSString *source;
@property (strong, nonatomic) NSString *thumbnailURL;
@property (strong, nonatomic) NSString *user;
@property (strong, nonatomic) NSString *likes;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSArray *comments;
@property (strong, nonatomic) NSString *tags;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSString *photoURL;
@property (strong, nonatomic) NSString *postedTime;
@property (strong, nonatomic) NSString *caption;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary fromSource:(NSString *)source;

@end
