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
    
    PhotoQueryResult *selectedPhoto = [[PhotoQueryResult alloc] initWithDictionary:([GlobalPhotoQueryController sharedInstance].responseArray[self.detailPhotoIndex.row]) fromSource:@"instagram"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    [self.view addSubview:navBar];
    [navBar constrainWidthToView:self.view predicate:@"0"];
    [navBar constrainHeight:@"64"];
    [navBar alignTopEdgeWithView:self.view predicate:@"0"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Feed" style:UIBarButtonItemStyleDone target:self action:@selector(backButtonTapped)];
    backButton.tintColor = [UIColor whiteColor];
    
    UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
    navigationItem.title = [NSString stringWithFormat:@"@%@", selectedPhoto.user];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    navigationItem.leftBarButtonItem = backButton;
    
    navBar.items = @[navigationItem];
    navBar.barTintColor = UIColorFromRGB(0x7FADAD);
    
    self.scrollView = [[UIScrollView alloc] init];
    
    self.photoView = [[UIImageView alloc] init];
    //UIImageView *photoView = [UIImageView new];
    [self.photoView setImageWithURL:[NSURL URLWithString:selectedPhoto.photoURL]];
    [self.view addSubview:self.photoView];
    [self.photoView constrainWidthToView:self.view predicate:@"0"];
    [self.photoView constrainAspectRatio:@"1"];
    [self.photoView constrainTopSpaceToView:navBar predicate:@"0"];
    
    self.likeButton = [[UIButton alloc] init];
    UIImage *likeImageUntapped = [UIImage imageNamed:@"LikeIconEmpty40"];
    [self.likeButton setImage:likeImageUntapped forState:UIControlStateNormal];
    self.likeButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.likeButton];
    [self.likeButton alignLeadingEdgeWithView:self.view predicate:@"10"];
    [self.likeButton constrainTopSpaceToView:self.photoView predicate:@"5"];
    [self.likeButton constrainAspectRatio:@"0"];
    [self.likeButton constrainHeight:@"44"];
    
    self.likesLabel = [[UILabel alloc] init];
    self.likesLabel.font = [UIFont fontWithName:@"Raleway-Bold" size:28];
    self.likesLabel.text = [NSString stringWithFormat:@"%@", selectedPhoto.likes];
    self.likesLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.likesLabel];
    [self.likesLabel constrainTopSpaceToView:self.photoView predicate:@"5"];
    [self.likesLabel constrainLeadingSpaceToView:self.likeButton predicate:@"5"];
//    [self.likesLabel constrainTrailingSpaceToView:self.view predicate:@"-93"];
    [self.likesLabel constrainHeight:@"44"];
    
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.font = [UIFont fontWithName:@"RaleWay-Bold" size:28];
    self.dateLabel.textColor = [UIColor lightGrayColor];
    self.dateLabel.backgroundColor = [UIColor whiteColor];
    self.dateLabel.text = selectedPhoto.postedTime;
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    [self.dateLabel sizeToFit];
    [self.view addSubview:self.dateLabel];
    [self.dateLabel constrainTopSpaceToView:self.photoView predicate:@"5"];
    [self.dateLabel alignTrailingEdgeWithView:self.view predicate:@"-10"];
    [self.dateLabel constrainHeight:@"44"];
//    [self.dateLabel constrainWidth:@"130"];
    
    self.captionLabel = [[UILabel alloc] init];
    self.captionLabel.font = [UIFont fontWithName:@"Raleway-Regular" size:14];
    self.captionLabel.text = [NSString stringWithFormat:@"%@", selectedPhoto.caption];
    self.captionLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.captionLabel];
    [self.captionLabel constrainTopSpaceToView:self.likesLabel predicate:@"5"];
    [self.captionLabel alignLeadingEdgeWithView:self.view predicate:@"10"];
    self.captionLabel.numberOfLines = 0;
    self.captionLabel.preferredMaxLayoutWidth = (self.view.frame.size.width - 20);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
