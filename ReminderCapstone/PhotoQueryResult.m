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
        self.photoURL = [dictionary valueForKeyPath:@"images.standard_resolution.url"];
        self.thumbnailURL = [dictionary valueForKeyPath:@"images.thumbnail.url"];
        self.source = @"Instagram";
        self.user = [dictionary valueForKeyPath:@"user.username"];
        self.likes = [dictionary valueForKeyPath:@"likes.count"];
        self.date = [dictionary valueForKeyPath:@"created_time"];
        self.comments =[dictionary valueForKeyPath:@"comments"];
        self.tags = dictionary[@"tags"];
        
        return self;
        
    } else if ([source isEqualToString:@"facebook"]) {
        self.photo = [UIImage new];
        self.thumbnailURL = @"";
        self.source = @"";
        self.user = @"";
        self.likes = @"";
        self.date = @"";
        self.comments = nil;
        self.tags = @"";
        
        return self;
        
    } else {
        return self;
    }
}

@end
