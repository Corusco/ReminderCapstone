//
//  SettingsViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 7/6/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "SettingsViewController.h"

static NSString * const kCellID = @"cellID";

@interface SettingsViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) NSIndexPath *selectedCellIndexPath;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(kPrimaryUIColor);
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Feed" style:UIBarButtonItemStyleDone target:self action:@selector(backButtonTapped)];
    backButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.title = @"User Settings";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.versionCell = [[UITableViewCell alloc] init];
    self.versionCell.backgroundColor = [UIColor lightGrayColor];
    self.versionCell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.versionCell.textLabel.text = @"version 1.0";
    self.versionCell.textLabel.textAlignment = NSTextAlignmentRight;
    self.versionCell.textLabel.textColor = [UIColor darkGrayColor];
    
    self.privacyCell = [[UITableViewCell alloc] init];
    self.privacyCell.backgroundColor = [UIColor lightGrayColor];
    self.privacyCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.privacyText = [[UILabel alloc] init];
    self.privacyText.backgroundColor = [UIColor lightGrayColor];
    self.privacyText.numberOfLines = 0;
    self.privacyText.translatesAutoresizingMaskIntoConstraints = NO;
    self.privacyText.lineBreakMode = NSLineBreakByWordWrapping;
    self.privacyText.textColor = [UIColor darkGrayColor];
    self.privacyText.font = [UIFont systemFontOfSize:12];
    
    [self.privacyCell.contentView addSubview:self.privacyText];
    [self.privacyText alignTopEdgeWithView:self.privacyCell.contentView predicate:@"0"];
    [self.privacyText alignBottomEdgeWithView:self.privacyCell.contentView predicate:@"0"];
    [self.privacyText alignLeadingEdgeWithView:self.privacyCell.contentView predicate:@"20"];
    [self.privacyText alignTrailingEdgeWithView:self.privacyCell.contentView predicate:@"-20"];
    
    self.privacyText.text = @"THREADS AND YOUR PRIVACY: We, the developers of Threads, are completely committed to you maintaining the level of privacy you desire and being transparent about what information we collect and why. Right now, we have access to your Instagram account details excluding your password. We record only these details on your device and on our server for the purposes of keeping you logged in and having a good user experience. Any photos or other content that you publish to instagram is subject to their privacy policy. If you refrain from posting to social media, anything that you do with this app is completely yours and stays strictly with you.";
    
    [self.view addSubview:self.tableView];

}

#pragma mark - Datasource and Delegate Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0: return self.versionCell;
                case 1: return self.privacyCell;
                    
            }
    }
    
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0: return 2;
            
        default: return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: return @"About Threads";
            
        default: return 0;
    }
}

- (void) backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath == [NSIndexPath indexPathForRow:1 inSection:0]) {
        
        return 200;
    } else {
        return 44;
    }
}

@end
