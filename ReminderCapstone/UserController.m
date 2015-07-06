//
//  UserController.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/11/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "UserController.h"
#import "User.h"
#import "Defines.h"
#import "WebLoginViewController.h"
#import "WebServiceManager.h"
#import "UIPrefix.h"
#import "CustomUIUtils.h"
#import "WebLoginViewController.h"

@implementation UserController

+ (instancetype)sharedInstance
{
    static UserController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UserController alloc] init];
        
        [sharedInstance loadUserFromDefaults];
    });
                 
    return sharedInstance;
}


- (void) getUserInstagramWithAccessToken:(NSString*)accessToken completion:(void(^)(void))callback {
    if (![CustomUIUtils checkNetworkConnection])
        return;
    
    NSString* userInfoUrl = [NSString stringWithFormat:@"%@/v1/users/self?access_token=%@", kInstagramAPIBaseURL,
                             accessToken];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:userInfoUrl]];
    
    [WebServiceManager sendRequest:request
                        completion:^ (NSData* responseData, NSError* error)
     {
         if (responseData)
         {
             NSDictionary* dictionary = [WebServiceManager JSONData:responseData];
             NSDictionary* userDictionary = [dictionary objectForKey:@"data"];
             if (userDictionary)
             {
                 User *userInstagramInfo = [[User alloc] initWithDictionaryInstagram:userDictionary];
                 userInstagramInfo.instagramAccessToken = accessToken;
             }
             callback ();
         }
         else
         {
             [CustomUIUtils messageAlert:@"Could not connect to server" title:@"Please Try Again" delegate:nil];
         }
     }];
}

- (void)saveUserToDefaults {
    
}

- (void)loadUserFromDefaults {
    
}


@end
