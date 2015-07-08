//
//  WebLoginViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/10/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "WebLoginViewController.h"
#import "Defines.h"
#import "User.h"
#import "MainFeedViewController.h"
#import "UserController.h"
@import WebKit;

@interface WebLoginViewController ()

@property (strong, nonatomic) UIWebView *webView;

@end

@implementation WebLoginViewController

- (void)viewWillAppear:(BOOL)animated {
    NSString *instagramLoginURL = [kInstagramBaseURL stringByAppendingFormat:kInstagramAuthenticationURL, kInstagramClientID, kInstagramRedirectURI];
    NSURLRequest *instagramRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:instagramLoginURL]];
    self.webView.delegate = self;
    [self.webView loadRequest:instagramRequest];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    
    //Add code for keeping user logged in to facebook when loading app
    if ([FBSDKAccessToken currentAccessToken]) {
        
    }
    
    [self.view addSubview:self.webView];
}


//Get instagram user access token
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *urlString = [[request URL] absoluteString];
    NSURL *url = [request URL];
    NSArray *urlParts = [url pathComponents];
    
    if ([urlParts count] == 1) {
        
        NSRange tokenParam = [urlString rangeOfString: kInstagramAccessToken];
        if (tokenParam.location != NSNotFound) {
            
            NSString *token = [urlString substringFromIndex: NSMaxRange(tokenParam)];
            
            // If there are more args, don't include them in the token:
            NSRange endRange = [token rangeOfString: @"&"];
            
            if (endRange.location != NSNotFound)
                token = [token substringToIndex: endRange.location];
            
            if ([token length] > 0 ) {
                [[UserController sharedInstance] getUserInstagramWithAccessToken:token completion:^{
                    [self dismissViewControllerAnimated:YES completion:nil];
                }];
            }
        } else {
            NSLog(@"rejected case, user denied request");
        }
        return NO;
    }
    return YES;
}



- (void)showMainView {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainFeedViewController *newMainFeedViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainFeedViewController"];
    [self presentViewController:newMainFeedViewController animated:YES completion:nil];
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
