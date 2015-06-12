//
//  UILoadingView.h
//  Version 1.0
//

#import <UIKit/UIKit.h>

@interface UILoadingView : UIView
{
    IBOutlet UIView* _borderView;
    IBOutlet UILabel* _activityLabel;

    IBOutlet UIActivityIndicatorView* _activityIndicator;
}

+ (UILoadingView*) loadingView;

- (void) showViewAnimated:(BOOL)animated onView:(UIView*)view;
- (void) removeViewAnimated:(BOOL)animated;

@end
