//
//  SettingsViewController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 7/6/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebLoginViewController.h"
#import "Defines.h"
#import "UserController.h"
#import "User.h"
#import "UserController.h"
#import "UIView+FLKAutoLayout.h"

@interface SettingsViewController : UIViewController

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UITableViewCell *realNameCell;
@property (strong, nonatomic) UITableViewCell *instagramAccountCell;
@property (strong, nonatomic) UITableViewCell *facebookAccountCell;
@property (strong, nonatomic) UITableViewCell *rateAppCell;
@property (strong, nonatomic) UITableViewCell *versionCell;
@property (strong, nonatomic) UITableViewCell *privacyCell;
@property (strong, nonatomic) UITableViewCell *notificationTime;
@property (strong, nonatomic) UILabel *privacyText;

@property (strong, nonatomic) UITextField *realNameText;

@end
