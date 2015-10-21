//
//  GlobalFeedCollectionViewDataSource.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/24/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GlobalPhotoQueryController.h"
#import "GlobalFeedChildViewController.h"
#import "PhotoQueryResult.h"
#import "UIImageView+AFNetworking.h"

@interface GlobalFeedCollectionViewDataSource : NSObject <UICollectionViewDataSource>

@property (strong, nonatomic) GlobalPhotoQueryController *globalPhotoQueryController;

@end
