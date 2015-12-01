//
//  DummyViewController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 11/24/15.
//  Copyright © 2015 CVLCD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalFeedChildViewController.h"

@interface DummyViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (strong, nonatomic) NSString *introLabelText;
@property (strong, nonatomic) GlobalFeedChildViewController *globalFeedChild;

@end
