//
//  MainFeedViewController.m
//  
//
//  Created by Justin Huntington on 6/9/15.
//
//

#import "MainFeedViewController.h"

@interface MainFeedViewController ()

@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIView *segmentView;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) FriendFeedChildViewController *friendFeedChild;
@property (strong, nonatomic) GlobalFeedChildViewController *globalFeedChild;
@property (strong, nonatomic) UIViewController *currentChild;



@end

@implementation MainFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headerView = [[UIView alloc] init];
    self.headerView.backgroundColor = UIColorFromRGB(0x2D6842);
    [self.view addSubview:self.headerView];
    [self.headerView alignLeading:0 trailing:0 toView:self.view];
    [self.headerView alignTopEdgeWithView:self.view predicate:@"0"];
    [self.headerView constrainHeight:@"200"];
    
    self.segmentView = [[UIView alloc] init];
    self.segmentView.backgroundColor = UIColorFromRGB(0x2D6842);
    self.segmentView.tintColor = [UIColor whiteColor];
    [self.view addSubview:self.segmentView];
    [self.segmentView constrainTopSpaceToView:self.headerView predicate:@"0"];
    [self.segmentView alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.segmentView constrainHeight:@"44"];
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Your Network", @"Global Inspiration"]];
    [self.segmentView addSubview:self.segmentedControl];
    [self.segmentedControl alignCenterWithView:self.segmentView];
    [self.segmentedControl addTarget:self
                              action:@selector(segmentedControlChanged:)
                    forControlEvents:UIControlEventValueChanged];
    
    self.friendFeedChild = [[FriendFeedChildViewController alloc] init];
    [self addChildViewController:self.friendFeedChild];
    self.friendFeedChild.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.friendFeedChild.view];
    [self.friendFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
    [self.friendFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.friendFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
    
    self.currentChild = self.friendFeedChild;
    
    self.globalFeedChild = [[GlobalFeedChildViewController alloc] init];
    [self.view addSubview:self.globalFeedChild.view];
    [self.globalFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
    [self.globalFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.globalFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
}


- (void)showFriendFeedChild {
    if (self.currentChild == self.friendFeedChild) {
        return;
    } else {
        [self addChildViewController:self.friendFeedChild];
        self.friendFeedChild.view.backgroundColor = [UIColor grayColor];
        
        [self transitionFromViewController:self.currentChild
                          toViewController:self.friendFeedChild
                                  duration:0.5
                                   options:UIViewAnimationOptionTransitionNone
                                animations:nil
                                completion:^(BOOL finished) {
                                    [self.currentChild removeFromParentViewController];
                                    [self.friendFeedChild didMoveToParentViewController:self];
                                    [self.friendFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
                                    [self.friendFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
                                    [self.friendFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
                                    self.currentChild = self.friendFeedChild;
                                }];
    }
}


- (void)showGlobalFeedChild {
    if (self.currentChild == self.globalFeedChild) {
        return;
    } else {
        [self addChildViewController:self.globalFeedChild];
        self.globalFeedChild.view.backgroundColor = [UIColor grayColor];
        
        [self transitionFromViewController:self.currentChild
                          toViewController:self.globalFeedChild
                                  duration:0.5
                                   options:UIViewAnimationOptionTransitionNone
                                animations:nil
                                completion:^(BOOL finished) {
                                    [self.currentChild removeFromParentViewController];
                                    [self.globalFeedChild didMoveToParentViewController:self];
                                    [self.globalFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
                                    [self.globalFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
                                    [self.globalFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
                                    self.currentChild = self.globalFeedChild;
                                }];
    }
}

- (void)segmentedControlChanged:(UISegmentedControl *)paramSender {
    if ([paramSender isEqual: self.segmentedControl]) {
        
//        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        if (self.segmentedControl.selectedSegmentIndex == 0) {
            [self showFriendFeedChild];
            NSLog(@"Tab One Selected");
        } else if (self.segmentedControl.selectedSegmentIndex == 1) {
            [self showGlobalFeedChild];
            NSLog(@"Tab Two Selected");
        }
    }
}

@end
