//
//  PhotoDetailNavController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/29/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoQueryResult.h"
#import "GlobalFeedCollectionViewDataSource.h"
#import "GlobalPhotoQueryController.h"
#import "UIImageView+AFNetworking.h"
#import "UIView+FLKAutoLayout.h"

@interface PhotoDetailNavController : UINavigationController

@property (assign, nonatomic) NSIndexPath *detailPhotoIndex;
@property (strong, nonatomic) UIImageView *photoView;
@property (strong, nonatomic) UILabel *userLabel;
@property (strong, nonatomic) UILabel *likesLabel;
@property (strong, nonatomic) UILabel *commentsLabel;
@property (strong, nonatomic) UIButton *likeButton;

@end
