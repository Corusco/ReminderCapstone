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
@property (strong, nonatomic) UIView *segmentView;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
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
    self.headerTheme.text = self.headerThemeText;
    [self.headerView addSubview:self.headerTheme];  
    [self.headerTheme constrainWidth:@"400" height:@"44"];
    [self.headerTheme alignLeadingEdgeWithView:self.headerView predicate:@"20"];
    [self.headerTheme alignBottomEdgeWithView:self.headerView predicate:@"-20"];
    
    self.introLabel = [[UILabel alloc] init];
    self.introLabel.text = self.introLabelText;
    self.introLabel.font = [UIFont fontWithName:@"Raleway-Regular" size:15];
    self.introLabel.textColor = [UIColor whiteColor];
    [self.headerView addSubview:self.introLabel];
    [self.introLabel constrainBottomSpaceToView:self.headerTheme predicate:@"4"];
    [self.introLabel constrainWidth:@"200"];
    [self.introLabel constrainHeight:@"20"];
    [self.introLabel alignLeadingEdgeWithView:self.headerTheme predicate:@"0"];
    
    self.globalFeedChild = [[GlobalFeedChildViewController alloc] init];
    [self addChildViewController:self.globalFeedChild];
    self.globalFeedChild.view.hidden = NO;
    [self.view addSubview:self.globalFeedChild.view];
    [self.globalFeedChild.view constrainTopSpaceToView:self.headerView predicate:@"0"];
    [self.globalFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.globalFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
    
    self.currentChild = self.globalFeedChild;
}



@end