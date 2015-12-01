//
//  GlobalPhotoQueryController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/23/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIServiceManager.h"
#import "Defines.h"

@interface GlobalPhotoQueryController : NSObject

@property (strong, nonatomic) NSArray *responseArray;

- (void)searchForInstagramPhotosWithTheme:(NSString *)theme;

@end
