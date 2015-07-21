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
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(reloadInstagramAccountCell) name:kInstagramLoginFinished object:nil];
        
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x7FADAD);
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Feed" style:UIBarButtonItemStyleDone target:self action:@selector(backButtonTapped)];
    backButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.title = @"User Settings";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.realNameText = [[UITextField alloc] init];
    self.realNameText.placeholder = @"Full Name";
    
    self.realNameCell = [[UITableViewCell alloc] init];
    self.realNameCell.backgroundColor = [UIColor whiteColor];
    [self.realNameCell addSubview:self.realNameText];
    [self.realNameText alignLeadingEdgeWithView:self.realNameCell predicate:@"20"];
    [self.realNameText alignTrailingEdgeWithView:self.realNameCell predicate:@"-20"];
    [self.realNameText constrainHeightToView:self.realNameCell predicate:@"0"];
    
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
    self.facebookAccountCell.textLabel.text = @"Facebook Integration Coming Soon!";
    self.facebookAccountCell.textLabel.textColor = [UIColor lightGrayColor];
    self.facebookAccountCell.imageView.image = [UIImage imageNamed:@"FacebookIconLoggedOut40"];
    self.facebookAccountCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.versionCell = [[UITableViewCell alloc] init];
    self.versionCell.backgroundColor = [UIColor lightGrayColor];
    self.versionCell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.versionCell.textLabel.text = @"version 0.5 (UltraBeta)";
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

    
    self.rateAppCell = [[UITableViewCell alloc] init];
    self.rateAppCell.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.tableView];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectedCellIndexPath = indexPath;
    
    if (indexPath == [NSIndexPath indexPathForRow:0 inSection:1]) {
        WebLoginViewController *webLogin = [[WebLoginViewController alloc] init];
        [self.navigationController showViewController:webLogin sender:nil];
    }
    
}

- (void)reloadInstagramAccountCell {
    CATransition *animation = [CATransition animation];
    animation.duration = 1.5;
    animation.type = kCATransitionFade;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.instagramAccountCell.imageView.layer addAnimation:animation forKey:@"changeTextTransition"];
    [self.instagramAccountCell.textLabel.layer addAnimation:animation forKey:@"changeTextTransition"];
    
    if ([UserController sharedInstance].currentUser.loggedInInstagram == YES) {
        self.instagramAccountCell.imageView.image = [UIImage imageNamed:@"InstaIconLoggedInMod40"];
        self.instagramAccountCell.textLabel.text = [UserController sharedInstance].currentUser.instagramUserName;
    } else {
        self.instagramAccountCell.textLabel.text = @"Tap to add Instagram Account";
        self.instagramAccountCell.imageView.image = [UIImage imageNamed:@"InstaIconLoggedOutMod40"];
    }
}

- (void)reloadSettingsView {
    NSLog(@"Reloading Table");
    NSArray *indexArray = @[self.selectedCellIndexPath];
    [self.tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
    
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
                case 0: return self.versionCell;
                    
                case 1: return self.privacyCell;
                    
            }
    }
    
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return 1;
            
        case 1: return 2;
            
        case 2: return 2;
            
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath == [NSIndexPath indexPathForRow:1 inSection:2]) {
//        CGFloat height = [self.privacyCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        
        return 200;
    } else {
        return 44;
    }
}

@end
