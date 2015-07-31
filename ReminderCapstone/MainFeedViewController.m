//
//  MainFeedViewController.m
//  
//
//  Created by Justin Huntington on 6/9/15.
//
//

#import "MainFeedViewController.h"

@interface MainFeedViewController ()

@property (strong, nonatomic) UILabel *introLabel;
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UILabel *headerTheme;
@property (strong, nonatomic) UIView *segmentView;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) FriendFeedChildViewController *friendFeedChild;
@property (strong, nonatomic) GlobalFeedChildViewController *globalFeedChild;
@property (strong, nonatomic) UIViewController *currentChild;
@property (strong, nonatomic) NSString *dailyThemeString;

@end

@implementation MainFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.headerView = [[UIView alloc] init];
    self.headerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.headerView];
    [self.headerView alignLeading:0 trailing:0 toView:self.view];
    [self.headerView alignTopEdgeWithView:self.view predicate:@"0"];
    [self.headerView constrainHeight:@"75"];
    
    self.headerTheme = [[UILabel alloc] init];
    self.headerTheme.textColor = [UIColor whiteColor];
    self.headerTheme.font = [UIFont fontWithName:@"Lobster 1.4" size:40];
    self.headerTheme.text = @"Life Won't Wait";
    [self.headerView addSubview:self.headerTheme];  
    [self.headerTheme constrainWidth:@"400" height:@"44"];
    [self.headerTheme alignLeadingEdgeWithView:self.headerView predicate:@"20"];
    [self.headerTheme alignBottomEdgeWithView:self.headerView predicate:@"-20"];
    
    self.introLabel = [[UILabel alloc] init];
    self.introLabel.text = @"Today's theme is:";
    self.introLabel.font = [UIFont fontWithName:@"Raleway-Regular" size:15];
    self.introLabel.textColor = [UIColor whiteColor];
    [self.headerView addSubview:self.introLabel];
    [self.introLabel constrainBottomSpaceToView:self.headerTheme predicate:@"4"];
    [self.introLabel constrainWidth:@"200"];
    [self.introLabel constrainHeight:@"20"];
    [self.introLabel alignLeadingEdgeWithView:self.headerTheme predicate:@"0"];
    
    self.segmentView = [[UIView alloc] init];
    self.segmentView.backgroundColor = UIColorFromRGB(0x7FADAD);
    self.segmentView.tintColor = [UIColor whiteColor];
    [self.view addSubview:self.segmentView];
    [self.segmentView constrainTopSpaceToView:self.headerView predicate:@"0"];
    [self.segmentView alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.segmentView constrainHeight:@"44"];
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"From Your Friends", @"Global Inspiration"]];
    self.segmentedControl.selectedSegmentIndex = 1;
    [self.segmentView addSubview:self.segmentedControl];
    [self.segmentedControl alignCenterWithView:self.segmentView];
    [self.segmentedControl addTarget:self
                              action:@selector(segmentedControlChanged:)
                    forControlEvents:UIControlEventValueChanged];
    
    self.friendFeedChild = [[FriendFeedChildViewController alloc] init];
    [self addChildViewController:self.friendFeedChild];
    [self.view addSubview:self.friendFeedChild.view];
    self.friendFeedChild.view.hidden = NO;
    [self.friendFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
    [self.friendFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.friendFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
    
    self.globalFeedChild = [[GlobalFeedChildViewController alloc] init];
    [self addChildViewController:self.globalFeedChild];
    self.globalFeedChild.view.hidden = NO;
    [self.view addSubview:self.globalFeedChild.view];
    [self.globalFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
    [self.globalFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.globalFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
    
    self.currentChild = self.globalFeedChild;
}


- (void)showFriendFeedChild {
    if (self.currentChild == self.friendFeedChild) {
        return;
    } else {
        [self addChildViewController:self.friendFeedChild];
        
        [self transitionFromViewController:self.currentChild
                          toViewController:self.friendFeedChild
                                  duration:0.5
                                   options:UIViewAnimationOptionTransitionNone
                                animations:nil
                                completion:^(BOOL finished) {
                                    [self.globalFeedChild willMoveToParentViewController:nil];
                                    [self.currentChild willMoveToParentViewController:nil];
                                    [self.currentChild.view removeFromSuperview];
                                    [self.globalFeedChild.view removeFromSuperview];
                                    [self.currentChild removeFromParentViewController];
                                    [self.globalFeedChild removeFromParentViewController];
                                    [self.friendFeedChild didMoveToParentViewController:self];
                                    self.globalFeedChild.view.hidden = YES;
                                    self.friendFeedChild.view.hidden = NO;
                                    [self.friendFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
                                    [self.friendFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
                                    [self.friendFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
                                    self.currentChild = self.friendFeedChild;
                                    
                                    [self.friendFeedChild.collectionView constrainBottomSpaceToView:self.friendFeedChild.bottomLayoutGuide predicate:@"0"];
                                    
                                    [self.friendFeedChild.collectionView constrainHeightToView:self.friendFeedChild.view predicate:@"0"];
                                    [self.friendFeedChild.collectionView constrainWidthToView:self.friendFeedChild.view predicate:@"0"];
                                    
                                    NSLog(@"Friend Child Finished");
                                }];
    }
}


- (void)showGlobalFeedChild {
    if (self.currentChild == self.globalFeedChild) {
        return;
    } else {
        [self addChildViewController:self.globalFeedChild];
        
        [self transitionFromViewController:self.currentChild
                          toViewController:self.globalFeedChild
                                  duration:0.5
                                   options:UIViewAnimationOptionTransitionNone
                                animations:nil
                                completion:^(BOOL finished) {
                                    [self.friendFeedChild willMoveToParentViewController:nil];
                                    [self.currentChild willMoveToParentViewController:nil];
                                    [self.currentChild.view removeFromSuperview];
                                    [self.friendFeedChild.view removeFromSuperview];
                                    [self.currentChild removeFromParentViewController];
                                    [self.friendFeedChild removeFromParentViewController];
                                    [self.globalFeedChild didMoveToParentViewController:self];
                                    self.friendFeedChild.view.hidden = YES;
                                    self.globalFeedChild.view.hidden = NO;
                                    [self.globalFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
                                    [self.globalFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
                                    [self.globalFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
                                    self.currentChild = self.globalFeedChild;
                                    
                                    [self.globalFeedChild.collectionView constrainBottomSpaceToView:self.globalFeedChild.bottomLayoutGuide predicate:@"0"];
                                    
                                    [self.globalFeedChild.collectionView constrainHeightToView:self.globalFeedChild.view predicate:@"0"];
                                    [self.globalFeedChild.collectionView constrainWidthToView:self.globalFeedChild.view predicate:@"0"];
                                    
                                    NSLog(@"Global Child Finished");
                                }];
    }
}

- (void)segmentedControlChanged:(UISegmentedControl *)paramSender {
    if ([paramSender isEqual: self.segmentedControl]) {
        
        if (self.segmentedControl.selectedSegmentIndex == 0) {
            [self showFriendFeedChild];
        } else if (self.segmentedControl.selectedSegmentIndex == 1) {
            [self showGlobalFeedChild];
        }
    }
}

@end