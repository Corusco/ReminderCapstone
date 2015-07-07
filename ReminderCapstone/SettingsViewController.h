//
//  SettingsViewController.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 7/6/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UITableViewCell *realNameCell;
@property (strong, nonatomic) UITableViewCell *instagramAccountCell;
@property (strong, nonatomic) UITableViewCell *facebookAccountCell;
@property (strong, nonatomic) UITableViewCell *rateAppCell;
@property (strong, nonatomic) UITableViewCell *notificationTime;

@property (strong, nonatomic) UITextField *realNameText;

@end
