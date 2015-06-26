//
//  photoQueryResult.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/23/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "PhotoQueryResult.h"

@implementation PhotoQueryResult

- (instancetype)initWithDictionary:(NSDictionary *)dictionary fromSource:(NSString *)source {
    self = [super init];
    if ([source isEqualToString:@"instagram"]) {
        self.photo =  [UIImage imageWithData:[NSData dataWithContentsOfFile:@"[images[standard_resolution[url]]]"]];
        self.thumbnailURL = @"";
        self.source = @"Instagram";
        self.user = @"";
        self.likes = @"";
        self.date = @"";
        self.comments = @"";
        self.tags = @"";
        
        return self;
        
    } else if ([source isEqualToString:@"facebook"]) {
        self.photo = [UIImage new];
        self.thumbnailURL = @"";
        self.source = @"";
        self.user = @"";
        self.likes = @"";
        self.date = @"";
        self.comments = @"";
        self.tags = @"";
        
        return self;
        
    } else {
        return self;
    }
}

@end
