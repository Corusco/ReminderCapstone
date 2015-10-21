//
//  GlobalFeedCollectionViewDataSource.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/24/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "GlobalFeedCollectionViewDataSource.h"

static NSString * const cellIDkey = @"cellID";

@implementation GlobalFeedCollectionViewDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.globalPhotoQueryController = [[GlobalPhotoQueryController alloc] init];
    }
    return self;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIDkey forIndexPath:indexPath];
    
    PhotoQueryResult *photo = [[PhotoQueryResult alloc] initWithDictionary:(self.globalPhotoQueryController.responseArray[indexPath.row]) fromSource:@"instagram"];
    UIImageView *photoView = [[UIImageView alloc] init];
    photoView.frame = cell.contentView.bounds;
    [photoView setImageWithURL:[NSURL URLWithString:photo.photoURL]];
    [cell.contentView addSubview:photoView];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.globalPhotoQueryController.responseArray count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}



@end
