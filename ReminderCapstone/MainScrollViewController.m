//
//  MainScrollViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 7/28/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "MainScrollViewController.h"

@interface MainScrollViewController ()

@property (strong, nonatomic) UIButton *cameraButton;
@property (strong, nonatomic) UIButton *settingsButton;
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) UIDocumentInteractionController *documentInteractionController;
@property (strong, nonatomic) UIImage *imageToShare;
@property (strong, nonatomic) MainFeedViewController *todayFeed;
@property (strong, nonatomic) MainFeedViewController *yesterdayFeed;
@property (strong, nonatomic) MainFeedViewController *dayBeforeFeed;

@end

@implementation MainScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.scrollView];
    [self.scrollView alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.scrollView alignTopEdgeWithView:self.view predicate:@"50"];
    [self.scrollView alignBottomEdgeWithView:self.view predicate:@"0"];
    
    self.dayBeforeFeed = [[MainFeedViewController alloc] init];
    self.dayBeforeFeed.introLabelText = @"The day before was:";
    self.dayBeforeFeed.headerThemeText = @"Life Really Didn't Wait";
    self.dayBeforeFeed.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addChildViewController:self.dayBeforeFeed];
    [self.dayBeforeFeed didMoveToParentViewController:self];
    [self.scrollView addSubview:self.dayBeforeFeed.view];
    
    self.yesterdayFeed = [[MainFeedViewController alloc] init];
    self.yesterdayFeed.introLabelText = @"Yesterday's theme was:";
    self.yesterdayFeed.headerThemeText = @"Life Didn't Wait";
    self.yesterdayFeed.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addChildViewController:self.yesterdayFeed];
    [self.yesterdayFeed didMoveToParentViewController:self];
    [self.scrollView addSubview:self.yesterdayFeed.view];

    self.todayFeed = [[MainFeedViewController alloc] init];
    self.todayFeed.introLabelText = @"Todays theme is:";
    self.todayFeed.headerThemeText = @"Life Won't Wait";
    self.todayFeed.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addChildViewController:self.todayFeed];
    [self.todayFeed didMoveToParentViewController:self];
    [self.scrollView addSubview:self.todayFeed.view];
    
    [self layoutDayFeeds];
    
    

}

- (void)viewDidLayoutSubviews {
    CGPoint pageThreePoint = CGPointMake(self.scrollView.bounds.size.width*2, 0);
    
    [self.scrollView setContentOffset:pageThreePoint animated:NO];

}

- (void)layoutDayFeeds {
    
    [self.dayBeforeFeed.view alignLeadingEdgeWithView:self.scrollView predicate:@"0"];
    [self.dayBeforeFeed.view alignTopEdgeWithView:self.scrollView predicate:@"0"];
    [self.dayBeforeFeed.view constrainWidthToView:self.scrollView predicate:@"0"];
    [self.dayBeforeFeed.view constrainHeightToView:self.scrollView predicate:@"0"];
    
    [self.yesterdayFeed.view constrainLeadingSpaceToView:self.dayBeforeFeed.view predicate:@"0"];
    [self.yesterdayFeed.view alignTopEdgeWithView:self.scrollView predicate:@"0"];
    [self.yesterdayFeed.view constrainWidthToView:self.scrollView predicate:@"0"];
    [self.yesterdayFeed.view constrainHeightToView:self.scrollView predicate:@"0"];
    
    [self.todayFeed.view constrainLeadingSpaceToView:self.yesterdayFeed.view predicate:@"0"];
    [self.todayFeed.view alignTopEdgeWithView:self.scrollView predicate:@"0"];
    [self.todayFeed.view constrainHeightToView:self.scrollView predicate:@"0"];
    [self.todayFeed.view constrainWidthToView:self.scrollView predicate:@"0"];
    [self.todayFeed.view alignTrailingEdgeWithView:self.scrollView predicate:@"0"];
    
}

- (void)checkForCamera {
    
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self cameraAvailableAlertWithPicker:self.imagePicker];
    } else {
        [self cameraUnavailableWithPicker:self.imagePicker];
    }
}

- (void)cameraAvailableAlertWithPicker:(UIImagePickerController *)picker {
    
    UIAlertController *availableAlert = [UIAlertController alertControllerWithTitle:@"Would you like to use the camera or an choose from your gallery?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        dispatch_async(dispatch_get_main_queue(), ^{
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:nil];
        });
    }];
    
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        dispatch_async(dispatch_get_main_queue(), ^{
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:picker animated:YES completion:nil];
        });
    }];
    
    [availableAlert addAction:cameraAction];
    [availableAlert addAction:libraryAction];
    
    [self presentViewController:availableAlert animated:YES completion:nil];
}

- (void)cameraUnavailableWithPicker:(UIImagePickerController *)picker {
    
    UIAlertController *unavailableAlert = [UIAlertController alertControllerWithTitle:@"No camera available on this device." message:@"Would you like to continue with a choice from your gallery?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        dispatch_async(dispatch_get_main_queue(), ^{
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:picker animated:YES completion:nil];
        });
    }];
    
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil];
    
    [unavailableAlert addAction:libraryAction];
    [unavailableAlert addAction:dismissAction];
    
    [self presentViewController:unavailableAlert animated:YES completion:nil];
}

- (void)settingsButtonTapped {
    
    SettingsViewController *settingsViewController = [[SettingsViewController alloc] init];
    UINavigationController *settingsNavController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    
    
    [self showViewController:settingsNavController sender:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        == kCFCompareEqualTo) {
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        
        self.imageToShare = imageToSave;
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Share to Instagram or save to phone only?" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *instagramShareAction = [UIAlertAction actionWithTitle:@"Share to Instagram" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self shareToInstagram];
        }];
        UIAlertAction *saveOnlyAction = [UIAlertAction actionWithTitle:@"Save Only" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:instagramShareAction];
        [alertController addAction:saveOnlyAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

- (void)shareToInstagram {
    NSString *imageLocationString = [NSString stringWithFormat:@"%@/image.igo", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]];
    [[NSFileManager defaultManager]removeItemAtPath:imageLocationString error:nil];
    [UIImagePNGRepresentation(self.imageToShare) writeToFile:imageLocationString atomically:YES];
    
    self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:imageLocationString]];
    self.documentInteractionController.delegate = self;
    self.documentInteractionController.UTI = @"com.instagram.exclusivegram";
    NSString *annotationString = [NSString stringWithFormat: @"#lifewontwait, #globalthread"];
    self.documentInteractionController.annotation = [NSDictionary dictionaryWithObject:annotationString forKey:@"InstagramCaption"];
    [self.documentInteractionController presentOpenInMenuFromRect:CGRectZero inView:self.view animated:YES];
}




@end
