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
@property (strong, nonatomic) DummyViewController *todayFeed;
@property (strong, nonatomic) DummyViewController *yesterdayFeed;
@property (strong, nonatomic) DummyViewController *dayBeforeFeed;


@end

@implementation MainFeedPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(assignThemes) name:kThemeQueryFinished object:nil];
    
    self.headerView = [[UIView alloc] init];
    self.headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headerView];
    [self.headerView alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.headerView alignTopEdgeWithView:self.view predicate:@"0"];
    [self.headerView constrainHeight:@"135"];
    
    self.settingsButton = [[UIButton alloc] init];
    UIImage *buttonImage = [UIImage imageNamed:@"basic-settings-iconWhite.png"];
    [self.settingsButton addTarget:self action:@selector(settingsButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.settingsButton setImage:buttonImage forState:UIControlStateNormal];
    self.settingsButton.tintColor = UIColorFromRGB(kPrimaryUIColor);
    [self.headerView addSubview:self.settingsButton];
    [self.settingsButton constrainHeight:@"24"];
    [self.settingsButton constrainAspectRatio:@"0"];
    [self.settingsButton alignTrailingEdgeWithView:self.headerView predicate:@"-10"];
    [self.settingsButton alignTopEdgeWithView:self.headerView predicate:@"25"];
    
    self.cameraButton = [[UIButton alloc] init];
    UIImage *cameraImage = [UIImage imageNamed:@"CameraIconTight40.png"];
    [self.cameraButton addTarget:self action:@selector(checkForCamera) forControlEvents:UIControlEventTouchUpInside];
    [self.cameraButton setImage:cameraImage forState:UIControlStateNormal];
    self.cameraButton.tintColor = UIColorFromRGB(kPrimaryUIColor);
    [self.headerView addSubview:self.cameraButton];
    [self.cameraButton constrainHeight:@"24"];
    [self.cameraButton constrainWidth:@"30"];
    [self.cameraButton constrainTrailingSpaceToView:self.settingsButton predicate:@"-15"];
    [self.cameraButton alignTopEdgeWithView:self.headerView predicate:@"25" ];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                          navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                        options:nil];
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    
    [[ThemeQueryController sharedInstance] getTodaysThemes];
    
    self.todayFeed = [self.storyboard instantiateViewControllerWithIdentifier:@"DummyViewController"];
    
    NSArray *feedVCArray = [NSArray arrayWithObject:self.todayFeed];
    
    [self.pageController setViewControllers:feedVCArray direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    self.pageController.view.frame = self.view.bounds;
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];
    [self.pageController.view alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.pageController.view alignTopEdgeWithView:self.view predicate:@"50"];
    [self.pageController.view alignBottomEdgeWithView:self.view predicate:@"0"];
}


#pragma mark - UI Data Methods

- (void)assignThemes {
    self.dayBeforeFeed.themeLabel.text = [ThemeQueryController sharedInstance].dayBeforeTheme.themeTitle;
    self.yesterdayFeed.themeLabel.text = [ThemeQueryController sharedInstance].yesterdayTheme.themeTitle;
    self.todayFeed.themeLabel.text = [ThemeQueryController sharedInstance].todayTheme.themeTitle;
    
    [self.dayBeforeFeed.globalFeedChild assignTheme:[ThemeQueryController sharedInstance].dayBeforeTheme];
    [self.yesterdayFeed.globalFeedChild assignTheme:[ThemeQueryController sharedInstance].yesterdayTheme];
    [self.todayFeed.globalFeedChild assignTheme:[ThemeQueryController sharedInstance].todayTheme];
    
    self.todayFeed.introLabel.text = @"Today's thread is:";
    self.yesterdayFeed.introLabel.text = @"Yesterday's thread was:";
    self.dayBeforeFeed.introLabel.text = @"The day before was:";
    
    self.todayFeed.reverseArrow.hidden = NO;
    self.yesterdayFeed.reverseArrow.hidden = NO;
    self.yesterdayFeed.forwardArrow.hidden = NO;
    self.dayBeforeFeed.forwardArrow.hidden = NO;
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:kThemesAssigned object:self];
}


#pragma mark - PageViewDataSource Methods

- (DummyViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    switch (index) {
        case 0:
            if (!self.todayFeed) {
                self.todayFeed = [self.storyboard instantiateViewControllerWithIdentifier:@"DummyViewController"];
                
                return self.todayFeed;
            } else {
                
                return self.todayFeed;
            }
            break;
        case 1:
            if (!self.yesterdayFeed) {
                self.yesterdayFeed = [self.storyboard instantiateViewControllerWithIdentifier:@"DummyViewController"];
                
                return self.yesterdayFeed;
            } else {
                return self.yesterdayFeed;
            }
            break;
        case 2:
            if (!self.dayBeforeFeed) {
                self.dayBeforeFeed = [self.storyboard instantiateViewControllerWithIdentifier:@"DummyViewController"];
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
    
    if (viewController == self.todayFeed) {
        return [self viewControllerAtIndex:1];
    } else if (viewController == self.yesterdayFeed) {
        return [self viewControllerAtIndex:2];
    } else {
        return nil;
    }
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    if (viewController == self.dayBeforeFeed) {
        return [self viewControllerAtIndex:1];
    } else if (viewController == self.yesterdayFeed) {
        return [self viewControllerAtIndex:0];
    } else {
        return nil;
    }
}


- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    
    [self assignThemes];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:kPageViewWillTransition object:self];
}


#pragma mark - Camera and Instagram

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
    
    UIAlertController *availableAlert = [UIAlertController alertControllerWithTitle:@"Would you like to use the camera or choose from your gallery?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
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
    NSString *annotationString = [NSString stringWithFormat: @"#%@, #globalthread", [ThemeQueryController sharedInstance].todayTheme.themeHash];
    self.documentInteractionController.annotation = [NSDictionary dictionaryWithObject:annotationString forKey:@"InstagramCaption"];
    [self.documentInteractionController presentOpenInMenuFromRect:CGRectZero inView:self.view animated:YES];
}


#pragma mark - Settings

- (void)settingsButtonTapped {
    
    SettingsViewController *settingsViewController = [[SettingsViewController alloc] init];
    UINavigationController *settingsNavController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    
    [self showViewController:settingsNavController sender:nil];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
