//
//  SettingsViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 7/6/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "SettingsViewController.h"

static NSString * const kCellID = @"cellID";

@interface SettingsViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x7FADAD);
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Feed" style:UIBarButtonItemStyleDone target:self action:@selector(backButtonTapped)];
    backButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.title = @"User Settings";
    
    self.realNameCell = [[UITableViewCell alloc] init];
    self.realNameCell.backgroundColor = [UIColor whiteColor];
    
    self.realNameText = [[UITextField alloc] init];
    self.realNameText.placeholder = @"Full Name";
    
    self.instagramAccountCell = [[UITableViewCell alloc] init];
    self.instagramAccountCell.backgroundColor = [UIColor whiteColor];
    if ([UserController sharedInstance].currentUser.loggedInInstagram == YES) {
        self.instagramAccountCell.imageView.image = [UIImage imageNamed:@"InstaIconLoggedInMod40"];
        self.instagramAccountCell.textLabel.text = [UserController sharedInstance].currentUser.instagramUserName;
    } else {
        self.instagramAccountCell.textLabel.text = @"Tap to add Instagram Account";
        self.instagramAccountCell.imageView.image = [UIImage imageNamed:@"InstaIconLoggedOutMod40"];
    }
    
    self.facebookAccountCell = [[UITableViewCell alloc] init];
    self.facebookAccountCell.backgroundColor = [UIColor whiteColor];
    
    self.rateAppCell = [[UITableViewCell alloc] init];
    self.rateAppCell.backgroundColor = [UIColor darkGrayColor];
    
    
    [self.view addSubview:self.tableView];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%@ tapped", indexPath);
    
    if (indexPath == [NSIndexPath indexPathForRow:0 inSection:1]) {
        WebLoginViewController *webLogin = [[WebLoginViewController alloc] init];
        [self.navigationController showViewController:webLogin sender:nil];
    }
    
}

#pragma mark - Datasource and Delegate Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0: return self.realNameCell;
                    
            }
        case 1:
            switch (indexPath.row) {
                case 0: return self.instagramAccountCell;
                    
                case 1: return self.facebookAccountCell;
                    
            }
        case 2:
            switch (indexPath.row) {
                case 0: return self.rateAppCell;
                    
            }
    }
    
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return 1;
            
        case 1: return 2;
            
        case 2: return 1;
            
        default: return 0;
    };
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: return @"Your Information";
            
        case 1: return @"Linked Accounts";
        
        case 2: return @"About Threads";
            
        default: return 0;
    }
}

- (void) backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
