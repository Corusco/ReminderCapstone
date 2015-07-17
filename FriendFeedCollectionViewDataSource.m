//
//  FriendFeedCollectionViewDataSource.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 7/16/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "FriendFeedCollectionViewDataSource.h"
#import "FriendPhotoQueryController.h"
#import "GlobalFeedChildViewController.h"
#import "PhotoQueryResult.h"
#import "UIImageView+AFNetworking.h"

static NSString * const cellIDkey = @"cellID";

@implementation FriendFeedCollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIDkey forIndexPath:indexPath];
    
    PhotoQueryResult *photo = [[PhotoQueryResult alloc] initWithDictionary:([FriendPhotoQueryController sharedInstance].responseArray[indexPath.row]) fromSource:@"instagram"];
    UIImageView *photoView = [[UIImageView alloc] init];
    photoView.frame = cell.contentView.bounds;
    [photoView setImageWithURL:[NSURL URLWithString:photo.photoURL]];
    [cell.contentView addSubview:photoView];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[FriendPhotoQueryController sharedInstance].responseArray count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


@end
