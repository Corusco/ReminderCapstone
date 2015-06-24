//
//  GlobalFeedChildViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/22/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "GlobalFeedChildViewController.h"

@interface GlobalFeedChildViewController ()

@property (strong, nonatomic) UILabel *viewDesignator;

@end

@implementation GlobalFeedChildViewController

- (void)viewWillLoad {
    [[GlobalFeedDataSource sharedInstance] searchForInstagramPhotosWithTheme:@"lifewontwait"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[GlobalFeedDataSource sharedInstance] searchForInstagramPhotosWithTheme:@"lifewontwait"];
    
    self.viewDesignator = [UILabel new];
    self.viewDesignator.text = @"GLOBAL\nFEED";
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
