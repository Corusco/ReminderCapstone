//
//  FriendFeedCollectionViewDataSource.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 7/16/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FriendPhotoQueryController.h"
#import "GlobalFeedChildViewController.h"
#import "PhotoQueryResult.h"
#import "UIImageView+AFNetworking.h"

@interface FriendFeedCollectionViewDataSource : NSObject <UICollectionViewDataSource>

@property (strong, nonatomic) FriendPhotoQueryController *friendPhotoQueryController;

@end
