//
//  WebLoginViewController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/10/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "WebLoginViewController.h"
#import "Defines.h"
@import WebKit;

@interface WebLoginViewController ()

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation WebLoginViewController

- (void)viewWillAppear:(BOOL)animated {
    NSString *instagramLoginURL = [kInstagramBaseURL stringByAppendingFormat:kInstagramAuthenticationURL, kInstagramClientID, kInstagramRedirectURI];
    NSURLRequest *instagramRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:instagramLoginURL]];
    
    [self.webView loadRequest:instagramRequest];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    
    
    
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
