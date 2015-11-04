//
//  MainFeedPageViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 11/3/15.
//  Copyright © 2015 CVLCD. All rights reserved.
//

#import "MainFeedPageViewController.h"

@interface MainFeedPageViewController ()

@property (strong, nonatomic) UIButton *cameraButton;
@property (strong, nonatomic) UIButton *settingsButton;
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) UIDocumentInteractionController *documentInteractionController;
@property (strong, nonatomic) UIImage *imageToShare;
@property (strong, nonatomic) MainFeedViewController *todayFeed;
@property (strong, nonatomic) MainFeedViewController *yesterdayFeed;
@property (strong, nonatomic) MainFeedViewController *dayBeforeFeed;
@property (strong, nonatomic) ThemeQueryController *themeQueryController;

@end

@implementation MainFeedPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(assignThemes) name:kThemeQueryFinished object:nil];
    
    self.headerView = [[UIView alloc] init];
    self.headerView.backgroundColor = UIColorFromRGB(0x7FADAD);
    [self.view addSubview:self.headerView];
    [self.headerView alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.headerView alignTopEdgeWithView:self.view predicate:@"0"];
    [self.headerView constrainHeight:@"165"];
    
    self.settingsButton = [[UIButton alloc] init];
    UIImage *buttonImage = [UIImage imageNamed:@"basic-settings-iconWhite.png"];
    [self.settingsButton addTarget:self action:@selector(settingsButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.settingsButton setImage:buttonImage forState:UIControlStateNormal];
    [self.headerView addSubview:self.settingsButton];
    [self.settingsButton constrainHeight:@"24"];
    [self.settingsButton constrainAspectRatio:@"0"];
    [self.settingsButton alignTrailingEdgeWithView:self.headerView predicate:@"-10"];
    [self.settingsButton alignTopEdgeWithView:self.headerView predicate:@"25"];
    
    self.cameraButton = [[UIButton alloc] init];
    UIImage *cameraImage = [UIImage imageNamed:@"CameraIconTight40.png"];
    [self.cameraButton addTarget:self action:@selector(checkForCamera) forControlEvents:UIControlEventTouchUpInside];
    [self.cameraButton setImage:cameraImage forState:UIControlStateNormal];
    [self.headerView addSubview:self.cameraButton];
    [self.cameraButton constrainHeight:@"24"];
    [self.cameraButton constrainWidth:@"30"];
    [self.cameraButton constrainTrailingSpaceToView:self.settingsButton predicate:@"-15"];
    [self.cameraButton alignTopEdgeWithView:self.headerView predicate:@"25" ];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                          navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                        options:nil];
    self.pageController.dataSource = self;
    
    [[ThemeQueryController sharedInstance] getTodaysThemes];
    
    self.dayBeforeFeed = [[MainFeedViewController alloc] init];
    self.dayBeforeFeed.introLabelText = @"The day before was:";
    self.dayBeforeFeed.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.yesterdayFeed = [[MainFeedViewController alloc] init];
    self.yesterdayFeed.introLabelText = @"Yesterday's theme was:";
    self.yesterdayFeed.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.todayFeed = [[MainFeedViewController alloc] init];
    self.todayFeed.introLabelText = @"Todays theme is:";
    self.todayFeed.view.translatesAutoresizingMaskIntoConstraints = NO;
    
}

- (MainFeedViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    switch (index) {
        case 0:
            if (!self.todayFeed) {
                self.todayFeed = [[MainFeedViewController alloc] init];
                self.todayFeed.introLabelText = @"Todays theme is:";
                self.todayFeed.view.translatesAutoresizingMaskIntoConstraints = NO;
                
                return self.todayFeed;
            } else {
                return self.todayFeed;
            }
            break;
        case 1:
            if (!self.yesterdayFeed) {
                self.yesterdayFeed = [[MainFeedViewController alloc] init];
                self.yesterdayFeed.introLabelText = @"Yesterday's theme was:";
                self.yesterdayFeed.view.translatesAutoresizingMaskIntoConstraints = NO;
                
                return self.yesterdayFeed;
            } else {
                return self.yesterdayFeed;
            }
            break;
        case 2:
            if (!self.dayBeforeFeed) {
                self.dayBeforeFeed = [[MainFeedViewController alloc] init];
                self.dayBeforeFeed.introLabelText = @"The day before was:";
                self.dayBeforeFeed.view.translatesAutoresizingMaskIntoConstraints = NO;
                
                return self.dayBeforeFeed;
            } else {
                return self.dayBeforeFeed;
            }
            break;
        default:
            return nil;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    return [self ]
}



@end
