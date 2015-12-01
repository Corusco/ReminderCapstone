//
//  DummyViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 11/24/15.
//  Copyright © 2015 CVLCD. All rights reserved.
//

#import "DummyViewController.h"

@interface DummyViewController ()

@property (weak, nonatomic) IBOutlet UIView *headerView;

@end

@implementation DummyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueEmbed"]) {
        self.globalFeedChild = segue.destinationViewController;
    }
}

@end
