//
//  FriendFeedChildViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/22/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "FriendFeedChildViewController.h"
#import "UIView+FLKAutoLayout.h"

static NSString * const cellIDkey = @"cellID";

@interface FriendFeedChildViewController ()

@end

@implementation FriendFeedChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(reloadCollectionView) name:kInstagramSearchFinished object:nil];
    
    [[GlobalPhotoQueryController sharedInstance] searchForInstagramPhotosWithTheme:@"ldslife"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    self.datasource = [[GlobalFeedCollectionViewDataSource alloc] init];
    self.collectionView.dataSource = self.datasource;
    self.collectionView.delegate = self;
    
    self.collectionView.contentSize = CGSizeMake(self.view.frame.size.width/2, self.view.frame.size
                                                 .width/2);
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIDkey];
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    
    [self.view addSubview:self.collectionView];
    
}


- (void)reloadCollectionView {
    [self.collectionView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.collectionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width/2.02, self.view.frame.size.width/2.02);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    PhotoDetailViewController *detailView = [[PhotoDetailViewController alloc] init];
    
    detailView.detailPhotoIndex = indexPath;
    
    [self presentViewController:detailView animated:YES completion:nil];
}

@end
