//
//  AppDelegate.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/9/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "AppDelegate.h"



@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIPageControl *pagecontrol = [UIPageControl appearance];
    pagecontrol.backgroundColor = [UIColor clearColor];
    
    return YES;
}

@end
