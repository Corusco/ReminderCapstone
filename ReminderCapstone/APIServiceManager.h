//
//  APIServiceManager.h
//  ReminderCapstone
//
//  Created by Justin Huntington on 6/23/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFNetworking/AFNetworking.h"

@interface APIServiceManager : NSObject

+ (AFHTTPSessionManager *)instaAPI;

+ (void) getWithClientID:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
