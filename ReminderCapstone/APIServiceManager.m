//
//  APIServiceManager.m
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/23/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "Defines.h"
#import "APIServiceManager.h"
#import "AFHTTPSessionManager.h"
#import "UserController.h"

@implementation APIServiceManager

#pragma mark - Instagram API Goods

+ (AFHTTPSessionManager *)instaAPI {
    
    static AFHTTPSessionManager *instaAPI = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instaAPI = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.instagram.com/"]];
        instaAPI.requestSerializer = [AFJSONRequestSerializer serializer];
        instaAPI.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    
    return instaAPI;
}

+ (void)getWithClientID:(NSString *)URLString
                  parameters:(id)parameters
                     success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    NSDictionary *clientIdDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:kInstagramClientID, @"client_id", nil];
    
    if (parameters == nil) {
        
        [[self instaAPI] GET:URLString parameters:clientIdDictionary success:success failure:failure];
        
        
    } else {
        NSMutableDictionary *mutableParameters = [parameters mutableCopy];
        [mutableParameters addEntriesFromDictionary:clientIdDictionary];
        
        [[self instaAPI] GET:URLString parameters:mutableParameters success:success failure:failure];
        
    }
    

}

+ (void)getWithAccessToken:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                 failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    NSDictionary *accessTokenDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[UserController sharedInstance].currentUser.instagramAccessToken, @"access_token", nil];
    
    if (parameters == nil) {
        
        [[self instaAPI] GET:URLString parameters:accessTokenDictionary success:success failure:failure];
        
        
    } else {
        NSMutableDictionary *mutableParameters = [parameters mutableCopy];
        [mutableParameters addEntriesFromDictionary:accessTokenDictionary];
        
        [[self instaAPI] GET:URLString parameters:mutableParameters success:success failure:failure];
        
    }
    
    
}

#pragma mark - Theme Database API Goods

+ (AFHTTPSessionManager *)themeAPI {
    static AFHTTPSessionManager *themeAPI = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        themeAPI = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.ourcavalcade.com/service.php"]];
        themeAPI.requestSerializer = [AFJSONRequestSerializer serializer];
        themeAPI.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    return themeAPI;
}

+ (void)getThemeWithParameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    [[self themeAPI] GET:@"" parameters:parameters success:success failure:failure];
}



@end
