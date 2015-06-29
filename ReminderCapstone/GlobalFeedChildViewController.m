//
//  GlobalFeedChildViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/22/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "GlobalFeedChildViewController.h"

static NSString * const cellIDkey = @"cellID";

@interface GlobalFeedChildViewController ()

@end

@implementation GlobalFeedChildViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[GlobalPhotoQueryController sharedInstance] searchForInstagramPhotosWithTheme:@"lifewontwait"];
    
    self.viewDesignator = [UILabel new];
    self.viewDesignator.text = @"GLOBAL\nFEED";
    self.viewDesignator.textColor = [UIColor grayColor];
    self.viewDesignator.font = [UIFont systemFontOfSize:45];
    self.viewDesignator.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.viewDesignator];
    self.viewDesignator.adjustsFontSizeToFitWidth = NO;
    [self.viewDesignator alignCenterWithView:self.view];
    self.viewDesignator.numberOfLines = 2;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    self.datasource = [[GlobalFeedCollectionViewDataSource alloc] init];
    self.collectionView.dataSource = self.datasource;
    self.collectionView.delegate = self;

    self.collectionView.contentSize = CGSizeMake(self.view.frame.size.width/2, self.view.frame.size
                                                  .width/2);
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIDkey];
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:.5 alpha:.5];
    
    [self.view addSubview:self.collectionView];

}

- (void)viewDidAppear:(BOOL)animated {
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    PhotoDetailViewController *photoDetailView = [[PhotoDetailViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:photoDetailView];
    photoDetailView.detailPhotoIndex = indexPath.row;
    
    [self presentViewController:navController animated:YES completion:nil];
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
