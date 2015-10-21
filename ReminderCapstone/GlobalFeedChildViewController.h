//
//  GlobalFeedChildViewController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/22/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FLKAutoLayout.h"
#import "GlobalPhotoQueryController.h"
#import "PhotoQueryResult.h"
#import "PhotoDetailViewController.h"
#import "Defines.h"
#import "ThemeQueryController.h"



@interface GlobalFeedChildViewController : UIViewController <UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UILabel *viewDesignator;
@property (strong, nonatomic) GlobalPhotoQueryController *globalPhotoQueryController;
@property (strong, nonatomic) Theme *thisDaysTheme;

- (void)assignTheme:(Theme *)theme;

@end
