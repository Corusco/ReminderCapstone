//
//  MainFeedViewController.h
//  
//
//  Created by Justin Huntington on 6/9/15.
//
//

#import <UIKit/UIKit.h>

#import "Defines.h"
#import "GlobalFeedChildViewController.h"
#import "FriendFeedChildViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "SettingsViewController.h"


@interface MainFeedViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIDocumentInteractionControllerDelegate>

@property (strong, nonatomic) UILabel *headerTheme;
@property (strong, nonatomic) NSString *headerThemeText;
@property (strong, nonatomic) NSString *introLabelText;
@property (strong, nonatomic) FriendFeedChildViewController *friendFeedChild;
@property (strong, nonatomic) GlobalFeedChildViewController *globalFeedChild;

@end
