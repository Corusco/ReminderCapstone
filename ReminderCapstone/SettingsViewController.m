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
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.tableView registerClass:UITableViewCellStyleDefault forCellReuseIdentifier:kCellID];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.title = @"User Settings";
    
    self.realNameCell = [[UITableViewCell alloc] init];
    self.realNameCell.backgroundColor = [UIColor whiteColor];
    
    self.realNameText = [[UITextField alloc] init];
    self.realNameText.placeholder = @"Full Name";
    
    self.instagramAccountCell = [[UITableViewCell alloc] init];
    self.instagramAccountCell.backgroundColor = [UIColor lightGrayColor];
    
    self.facebookAccountCell = [[UITableViewCell alloc] init];
    self.facebookAccountCell.backgroundColor = [UIColor lightGrayColor];
    
    self.rateAppCell = [[UITableViewCell alloc] init];
    self.rateAppCell.backgroundColor = [UIColor darkGrayColor];
    
    
    [self.view addSubview:self.tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


@end
