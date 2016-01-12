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
        self.postedTime = [self calculatePostedTime:([dictionary valueForKeyPath:@"created_time"])];
        self.caption = [dictionary valueForKeyPath:@"caption.text"];
        self.photoID = [dictionary valueForKeyPath:@"id"];
        
        NSLog(@"%@",self.photoID );
        
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

- (NSString *) calculatePostedTime:(NSString *)postedTime {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateIntervalFormatterNoStyle;
    dateFormatter.dateStyle = NSDateIntervalFormatterShortStyle;
    NSTimeInterval currentInterval = [NSDate date].timeIntervalSince1970;
    
    
    if ( currentInterval - [postedTime doubleValue] < 86400) {
        
        NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *formattedPostedTime = [NSDate dateWithTimeIntervalSince1970:[postedTime doubleValue]];
        
        NSDateComponents *dateComponents = [currentCalendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:formattedPostedTime toDate:[NSDate date] options:0];
        
        long hours = [dateComponents hour];
        long minutes = [dateComponents minute];
        
        NSString *hourMinuteString = [NSString stringWithFormat:@"%ldh  %ldm", hours, minutes];
        
        return hourMinuteString;
        
    } else {
        NSTimeInterval postedInterval = [postedTime doubleValue];
        
        NSDate *calculatedDate = [NSDate dateWithTimeIntervalSince1970:postedInterval];
        
        NSString *calculatedString = [dateFormatter stringFromDate:calculatedDate];
        
        return calculatedString;
        
    } 
    
    
    
    
    
    
    
    
}

@end
