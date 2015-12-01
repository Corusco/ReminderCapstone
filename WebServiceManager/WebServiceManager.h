//
//  WebServiceManager.h
//  NetworkTestApp
//
//  Created by Justin Huntington on 6/12/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defines.h"

#define kMAX_CONNECTION

@interface WebServiceManager : NSObject
{
	
}


+ (NSURLRequest*) requestWithService:(NSString*)service;

+ (NSMutableURLRequest*) requestWithUrlString:(NSString*)urlString; // in case base url are not same

+ (NSURLRequest*) postRequestWithService:(NSString*)service
							  postString:(NSString*)postString;

+ (NSMutableURLRequest*) postRequestWithUrlString:(NSString*)urlString
								postString:(NSString*)postString;

+ (void) sendRequest:(NSURLRequest*)request
		  completion:(void (^)(NSData*, NSError*)) callback;

+ (id) JSONData:(NSData*)data;

@end
