//
//  MainScrollViewController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 7/28/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainFeedViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "ThemeQueryController.h"


@interface MainScrollViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIDocumentInteractionControllerDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;


@end
