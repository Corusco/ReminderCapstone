//
//  FriendFeedChildViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/22/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "FriendFeedChildViewController.h"
#import "UIView+FLKAutoLayout.h"

@interface FriendFeedChildViewController ()

@property (strong, nonatomic) UILabel *viewDesignator;

@end

@implementation FriendFeedChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewDesignator = [UILabel new];
    self.viewDesignator.text = @"FRIEND\nFEED";
    self.viewDesignator.textColor = [UIColor grayColor];
    self.viewDesignator.font = [UIFont systemFontOfSize:45];
    self.viewDesignator.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.viewDesignator];
    self.viewDesignator.adjustsFontSizeToFitWidth = NO;
    [self.viewDesignator alignCenterWithView:self.view];
    self.viewDesignator.numberOfLines = 2;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
