//
//  photoQueryResult.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/23/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "photoQueryResult.h"

@implementation photoQueryResult

- (void)initWithDictionary:(NSDictionary *)dictionary fromSource:(NSString *)source {
    if ([source isEqualToString:@"instagram"]) {
        self.photoURL = @"";
        self.thumbnailURL = @"";
        self.source = @"Instagram";
        self.user = @"";
        self.likes = @"";
        self.date = @"";
        self.comments = @"";
        self.tags = @"";
        
    } else if ([source isEqualToString:@"facebook"]) {
        self.photoURL = @"";
        self.thumbnailURL = @"";
        self.source = @"";
        self.user = @"";
        self.likes = @"";
        self.date = @"";
        self.comments = @"";
        self.tags = @"";
        
    } else {
        return;
    }
}

@end
