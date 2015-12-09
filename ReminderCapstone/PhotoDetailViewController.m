//
//  PhotoDetailViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/26/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "PhotoDetailViewController.h"

@interface PhotoDetailViewController ()

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    [self.view addSubview:navBar];
    [navBar constrainWidthToView:self.view predicate:@"0"];
    [navBar constrainHeight:@"64"];
    [navBar alignTopEdgeWithView:self.view predicate:@"0"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Feed" style:UIBarButtonItemStyleDone target:self action:@selector(backButtonTapped)];
    backButton.tintColor = [UIColor whiteColor];
    
    UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
    navigationItem.title = [NSString stringWithFormat:@"@%@", self.selectedPhoto.user];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    navigationItem.leftBarButtonItem = backButton;
    
    navBar.items = @[navigationItem];
    navBar.barTintColor = UIColorFromRGB(kPrimaryUIColor);
    
    CGRect imageRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:imageRect];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.scrollView];
    [self.scrollView constrainTopSpaceToView:navBar predicate:@"0"];
    [self.scrollView alignLeadingEdgeWithView:self.view predicate:@"0"];
    [self.scrollView alignTrailingEdgeWithView:self.view predicate:@"0"];
    [self.scrollView alignBottomEdgeWithView:self.view predicate:@"0"];

    self.photoView = [[UIImageView alloc] init];
    [self.photoView setImageWithURL:[NSURL URLWithString:self.selectedPhoto.photoURL]];
    [self.scrollView addSubview:self.photoView];
    [self.photoView constrainWidthToView:self.scrollView predicate:@"0"];
    [self.photoView constrainAspectRatio:@"0"];
    [self.photoView alignTopEdgeWithView:self.scrollView predicate:@"0"];
    
    self.likeButton = [[UIButton alloc] init];
    UIImage *likeImageUntapped = [UIImage imageNamed:@"LikeIconEmpty40"];
    [self.likeButton setImage:likeImageUntapped forState:UIControlStateNormal];
    self.likeButton.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.likeButton];
    [self.likeButton alignLeadingEdgeWithView:self.scrollView predicate:@"10"];
    [self.likeButton constrainTopSpaceToView:self.photoView predicate:@"5"];
    [self.likeButton constrainAspectRatio:@"0"];
    [self.likeButton constrainHeight:@"44"];
    
    self.likesLabel = [[UILabel alloc] init];
    self.likesLabel.font = [UIFont fontWithName:@"Raleway-Bold" size:28];
    self.likesLabel.text = [NSString stringWithFormat:@"%@", self.selectedPhoto.likes];
    self.likesLabel.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.likesLabel];
    [self.likesLabel constrainTopSpaceToView:self.photoView predicate:@"5"];
    [self.likesLabel constrainLeadingSpaceToView:self.likeButton predicate:@"5"];
    [self.likesLabel constrainHeight:@"44"];
    
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.font = [UIFont fontWithName:@"RaleWay-Bold" size:28];
    self.dateLabel.textColor = [UIColor lightGrayColor];
    self.dateLabel.backgroundColor = [UIColor whiteColor];
    self.dateLabel.text = self.selectedPhoto.postedTime;
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    [self.dateLabel sizeToFit];
    [self.scrollView addSubview:self.dateLabel];
    [self.dateLabel constrainTopSpaceToView:self.photoView predicate:@"5"];
    [self.dateLabel alignTrailingEdgeWithView:self.view predicate:@"-10"];
    [self.dateLabel constrainHeight:@"44"];
    
    self.captionLabel = [[UILabel alloc] init];
    self.captionLabel.font = [UIFont fontWithName:@"Raleway-Regular" size:14];
    self.captionLabel.text = [NSString stringWithFormat:@"%@", self.selectedPhoto.caption];
    self.captionLabel.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.captionLabel];
    [self.captionLabel constrainTopSpaceToView:self.likesLabel predicate:@"5"];
    [self.captionLabel alignLeadingEdgeWithView:self.scrollView predicate:@"10"];
    self.captionLabel.numberOfLines = 0;
    self.captionLabel.preferredMaxLayoutWidth = (self.view.frame.size.width - 20);
    
    [self.scrollView alignBottomEdgeWithView:self.captionLabel predicate:@"0"];
    [self.scrollView alignTrailingEdgeWithView:self.view predicate:@"0"];

}

- (void) backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
