//
//  MainFeedPageViewController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 11/3/15.
//  Copyright © 2015 CVLCD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainFeedViewController.h"
#import "UIKit+AFNetworking.h"
#import "UIView+FLKAutoLayout.h"
#import "ThemeQueryController.h"
#import "Defines.h"
#import "DummyViewController.h"


@interface MainFeedPageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIDocumentInteractionControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageController;

@end
