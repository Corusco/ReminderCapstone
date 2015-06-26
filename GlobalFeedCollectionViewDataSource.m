//
//  GlobalFeedCollectionViewDataSource.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/24/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "GlobalFeedCollectionViewDataSource.h"
#import "GlobalPhotoQueryController.h"
#import "GlobalFeedChildViewController.h"
#import "PhotoQueryResult.h"
#import "UIImageView+AFNetworking.h"

static NSString * const cellIDkey = @"cellID";

@implementation GlobalFeedCollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIDkey forIndexPath:indexPath];
    
    PhotoQueryResult *photo = [[PhotoQueryResult alloc] initWithDictionary:([GlobalPhotoQueryController sharedInstance].responseArray[indexPath.row]) fromSource:@"instagram"];
    UIImageView *photoView = [[UIImageView alloc] init];
    photoView.frame = cell.contentView.bounds;
    [photoView setImageWithURL:[NSURL URLWithString:photo.photoURL]];
    [cell.contentView addSubview:photoView];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[GlobalPhotoQueryController sharedInstance].responseArray count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}



@end
