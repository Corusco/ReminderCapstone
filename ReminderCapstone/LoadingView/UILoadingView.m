//
//  UILoadingView.m
//  Version 1.0
//

#import <QuartzCore/QuartzCore.h>
#import "UILoadingView.h"

@implementation UILoadingView

+ (UILoadingView*) loadingView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"UILoadingView" owner:self options:nil] objectAtIndex:0];
}

- (void) showViewAnimated:(BOOL)animated onView:(UIView*)view
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    if (self.superview)
        return;
    
    CGRect rect = view.bounds;
    [self setFrame:rect];
    
    [view addSubview:self];
    [view bringSubviewToFront:self];
    if (animated)
        [self animateShow];
    
    [_activityIndicator startAnimating];
}

- (void) removeViewAnimated:(BOOL)animated
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    if (!self.superview)
        return;
    
    [_activityIndicator stopAnimating];

    if (animated)
        [self animateRemove];
    else
        [self removeView];    
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self performSelector:@selector(privateInit) withObject:nil afterDelay:0.01];
    }
    return self;
}

- (void) animateShow;
{
    self.alpha = 0.0;
    _borderView.transform = CGAffineTransformMakeScale(3.0, 3.0);
    
	[UIView beginAnimations:nil context:nil];
    _borderView.transform = CGAffineTransformIdentity;
    self.alpha = 1.0;
    
	[UIView commitAnimations];
}

- (void) animateRemove;
{
    _borderView.transform = CGAffineTransformIdentity;
    
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(removeAnimationDidStop:finished:context:)];
	
    _borderView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    self.alpha = 0.0;
    
	[UIView commitAnimations];
}


- (void) removeView
{
    [self removeFromSuperview];
}

- (void) removeAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
{
    [self removeView];
}

- (void) privateInit
{
    [self setupBackground];
    [self setBorderView];;
    [self activityLabelWithText:@"Loading..."];
}

- (void) setupBackground
{
    self.opaque = NO;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.backgroundColor = [UIColor clearColor];//[[UIColor blackColor] colorWithAlphaComponent:0.35];
}

- (void) setBorderView;
{
    _borderView.opaque = NO;
    _borderView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    _borderView.backgroundColor = [UIColor clearColor];//[[UIColor blackColor] colorWithAlphaComponent:0.5];
    _borderView.layer.cornerRadius = 0.0;
}

- (void) activityLabelWithText:(NSString*)labelText;
{
    _activityLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    _activityLabel.textColor = [UIColor whiteColor];
    _activityLabel.backgroundColor = [UIColor clearColor];
    _activityLabel.shadowColor = [UIColor blackColor];
    _activityLabel.shadowOffset = CGSizeMake(0.0, 1.0);
    _activityLabel.text = labelText;
}

#ifdef ARC_DISABLE
- (void) dealloc
{
    [_activityIndicator release];
    [_activityLabel release];
    [_borderView release];
    
    [super dealloc];
}
#endif

@end
