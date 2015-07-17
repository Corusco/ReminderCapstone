//
//  MainFeedViewController.m
//  
//
//  Created by Justin Huntington on 6/9/15.
//
//

#import "MainFeedViewController.h"

@interface MainFeedViewController ()

@property (strong, nonatomic) UIButton *cameraButton;
@property (strong, nonatomic) UIButton *settingsButton;
@property (strong, nonatomic) UILabel *introLabel;
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UILabel *headerTheme;
@property (strong, nonatomic) UIView *segmentView;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) FriendFeedChildViewController *friendFeedChild;
@property (strong, nonatomic) GlobalFeedChildViewController *globalFeedChild;
@property (strong, nonatomic) UIViewController *currentChild;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) UIDocumentInteractionController *documentInteractionController;
@property (strong, nonatomic) UIImage *imageToShare;
@property (strong, nonatomic) NSString *dailyThemeString;

@end

@implementation MainFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.headerView = [[UIView alloc] init];
    self.headerView.backgroundColor = UIColorFromRGB(0x7FADAD);
    [self.view addSubview:self.headerView];
    [self.headerView alignLeading:0 trailing:0 toView:self.view];
    [self.headerView alignTopEdgeWithView:self.view predicate:@"0"];
    [self.headerView constrainHeight:@"140"];
    
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
    
    self.headerTheme = [[UILabel alloc] init];
    self.headerTheme.textColor = [UIColor whiteColor];
    self.headerTheme.font = [UIFont fontWithName:@"Lobster 1.4" size:40];
    self.headerTheme.text = @"Life Won't Wait";
    [self.headerView addSubview:self.headerTheme];  
    [self.headerTheme constrainWidth:@"400" height:@"44"];
    [self.headerTheme alignLeadingEdgeWithView:self.headerView predicate:@"20"];
    [self.headerTheme alignBottomEdgeWithView:self.headerView predicate:@"-20"];
    
    self.introLabel = [[UILabel alloc] init];
    self.introLabel.text = @"Today's theme is:";
    self.introLabel.font = [UIFont fontWithName:@"Raleway-Regular" size:15];
    self.introLabel.textColor = [UIColor whiteColor];
    [self.headerView addSubview:self.introLabel];
    [self.introLabel constrainBottomSpaceToView:self.headerTheme predicate:@"4"];
    [self.introLabel constrainWidth:@"200"];
    [self.introLabel constrainHeight:@"20"];
    [self.introLabel alignLeadingEdgeWithView:self.headerTheme predicate:@"0"];
    
    self.segmentView = [[UIView alloc] init];
    self.segmentView.backgroundColor = UIColorFromRGB(0x7FADAD);
    self.segmentView.tintColor = [UIColor whiteColor];
    [self.view addSubview:self.segmentView];
    [self.segmentView constrainTopSpaceToView:self.headerView predicate:@"0"];
    [self.segmentView alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.segmentView constrainHeight:@"44"];
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"From Your Friends", @"Global Inspiration"]];
    self.segmentedControl.selectedSegmentIndex = 1;
    [self.segmentView addSubview:self.segmentedControl];
    [self.segmentedControl alignCenterWithView:self.segmentView];
    [self.segmentedControl addTarget:self
                              action:@selector(segmentedControlChanged:)
                    forControlEvents:UIControlEventValueChanged];
    
    self.friendFeedChild = [[FriendFeedChildViewController alloc] init];
    [self addChildViewController:self.friendFeedChild];
    [self.view addSubview:self.friendFeedChild.view];
    self.friendFeedChild.view.hidden = NO;
    [self.friendFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
    [self.friendFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.friendFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
    
    self.globalFeedChild = [[GlobalFeedChildViewController alloc] init];
    [self addChildViewController:self.globalFeedChild];
    self.globalFeedChild.view.hidden = NO;
    [self.view addSubview:self.globalFeedChild.view];
    [self.globalFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
    [self.globalFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
    [self.globalFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
    
    self.currentChild = self.globalFeedChild;
}



- (void)showFriendFeedChild {
    if (self.currentChild == self.friendFeedChild) {
        return;
    } else {
        [self addChildViewController:self.friendFeedChild];
        
        [self transitionFromViewController:self.currentChild
                          toViewController:self.friendFeedChild
                                  duration:0.5
                                   options:UIViewAnimationOptionTransitionNone
                                animations:nil
                                completion:^(BOOL finished) {
                                    [self.globalFeedChild willMoveToParentViewController:nil];
                                    [self.currentChild willMoveToParentViewController:nil];
                                    [self.currentChild.view removeFromSuperview];
                                    [self.globalFeedChild.view removeFromSuperview];
                                    [self.currentChild removeFromParentViewController];
                                    [self.globalFeedChild removeFromParentViewController];
                                    [self.friendFeedChild didMoveToParentViewController:self];
                                    self.globalFeedChild.view.hidden = YES;
                                    self.friendFeedChild.view.hidden = NO;
                                    [self.friendFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
                                    [self.friendFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
                                    [self.friendFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
                                    self.currentChild = self.friendFeedChild;
                                    
                                    [self.friendFeedChild.collectionView constrainBottomSpaceToView:self.friendFeedChild.bottomLayoutGuide predicate:@"0"];
                                    
                                    [self.friendFeedChild.collectionView constrainHeightToView:self.friendFeedChild.view predicate:@"0"];
                                    [self.friendFeedChild.collectionView constrainWidthToView:self.friendFeedChild.view predicate:@"0"];
                                    
                                    NSLog(@"Friend Child Finished");
                                }];
    }
}


- (void)showGlobalFeedChild {
    if (self.currentChild == self.globalFeedChild) {
        return;
    } else {
        [self addChildViewController:self.globalFeedChild];
        
        [self transitionFromViewController:self.currentChild
                          toViewController:self.globalFeedChild
                                  duration:0.5
                                   options:UIViewAnimationOptionTransitionNone
                                animations:nil
                                completion:^(BOOL finished) {
                                    [self.friendFeedChild willMoveToParentViewController:nil];
                                    [self.currentChild willMoveToParentViewController:nil];
                                    [self.currentChild.view removeFromSuperview];
                                    [self.friendFeedChild.view removeFromSuperview];
                                    [self.currentChild removeFromParentViewController];
                                    [self.friendFeedChild removeFromParentViewController];
                                    [self.globalFeedChild didMoveToParentViewController:self];
                                    self.friendFeedChild.view.hidden = YES;
                                    self.globalFeedChild.view.hidden = NO;
                                    [self.globalFeedChild.view constrainTopSpaceToView:self.segmentView predicate:@"0"];
                                    [self.globalFeedChild.view alignLeading:@"0" trailing:@"0" toView:self.view];
                                    [self.globalFeedChild.view alignBottomEdgeWithView:self.view predicate:@"0"];
                                    self.currentChild = self.globalFeedChild;
                                    
                                    [self.globalFeedChild.collectionView constrainBottomSpaceToView:self.globalFeedChild.bottomLayoutGuide predicate:@"0"];
                                    
                                    [self.globalFeedChild.collectionView constrainHeightToView:self.globalFeedChild.view predicate:@"0"];
                                    [self.globalFeedChild.collectionView constrainWidthToView:self.globalFeedChild.view predicate:@"0"];
                                    
                                    NSLog(@"Global Child Finished");
                                }];
    }
}

- (void)segmentedControlChanged:(UISegmentedControl *)paramSender {
    if ([paramSender isEqual: self.segmentedControl]) {
        
        if (self.segmentedControl.selectedSegmentIndex == 0) {
            [self showFriendFeedChild];
        } else if (self.segmentedControl.selectedSegmentIndex == 1) {
            [self showGlobalFeedChild];
        }
    }
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
