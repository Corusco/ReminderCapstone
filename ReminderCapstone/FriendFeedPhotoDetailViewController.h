//
//  FriendFeedPhotoDetailViewController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 7/21/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoQueryResult.h"
#import "FriendPhotoQueryController.h"
#import "UIView+FLKAutoLayout.h"
#import "UIKit+AFNetworking.h"

@interface FriendFeedPhotoDetailViewController : UIViewController

@property (strong, nonatomic) UIScrollView *scrollView;
@property (assign, nonatomic) NSIndexPath *detailPhotoIndex;
@property (strong, nonatomic) UIImageView *photoView;
@property (strong, nonatomic) UILabel *userLabel;
@property (strong, nonatomic) UILabel *likesLabel;
@property (strong, nonatomic) UILabel *commentsLabel;
@property (strong, nonatomic) UIButton *likeButton;
@property (strong, nonatomic) UILabel *captionLabel;
@property (strong, nonatomic) UILabel *dateLabel;

@end
