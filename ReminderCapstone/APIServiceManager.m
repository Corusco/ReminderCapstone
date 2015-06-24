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

@implementation APIServiceManager

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

+ (void) getWithClientID:(NSString *)URLString
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

@end
