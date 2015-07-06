//
//  PhotoDetailNavController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/29/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "PhotoDetailNavController.h"

@interface PhotoDetailNavController ()

@end

@implementation PhotoDetailNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"< Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonTapped)];
    
    PhotoQueryResult *selectedPhoto = [[PhotoQueryResult alloc] initWithDictionary:([GlobalPhotoQueryController sharedInstance].responseArray[self.detailPhotoIndex.row]) fromSource:@"instagram"];
    
    UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
    navigationItem.title = selectedPhoto.user;
    navigationItem.leftBarButtonItem = backButton;
    
    
    self.navigationBar.items = @[navigationItem];
    self.navigationBar.barTintColor = [UIColor redColor];
    
    self.photoView = [[UIImageView alloc] init];
    //UIImageView *photoView = [UIImageView new];
    [self.photoView setImageWithURL:[NSURL URLWithString:selectedPhoto.photoURL]];
    [self.view addSubview:self.photoView];
    [self.photoView constrainWidthToView:self.view predicate:@"0"];
    [self.photoView constrainAspectRatio:@"1"];
    [self.photoView constrainTopSpaceToView:self.navigationBar predicate:@"0"];
    
    self.likesLabel = [[UILabel alloc] init];
    self.likesLabel.text = [NSString stringWithFormat:@"%@ Likes", selectedPhoto.likes];
    self.likesLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.likesLabel];
    [self.likesLabel constrainTopSpaceToView:self.photoView predicate:@"0"];
    [self.likesLabel alignLeadingEdgeWithView:self.view predicate:@"0"];
    [self.likesLabel constrainWidthToView:self.view predicate:@".33"];
    [self.likesLabel constrainHeight:@"44"];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
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
