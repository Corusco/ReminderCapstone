//
//  WebServiceManager.m
//  NetworkTestApp
//
//  Created by Justin Huntington on 6/12/15.
//  Copyright (c) 2015 CVLCD. All rights reserved.
//

#import "WebServiceManager.h"
#import "Defines.h"
#import "UIPrefix.h"
#import <UIKit/UIKit.h>
#import "CustomUIUtils.h"

@implementation WebServiceManager

+ (NSURLRequest*) requestWithService:(NSString*)service{
	NSString* urlString = [kServerUrl stringByAppendingString:service];
	return [WebServiceManager requestWithUrlString:urlString];
}


+ (NSMutableURLRequest*) requestWithUrlString:(NSString*)urlString {
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
    
    return (NSMutableURLRequest*)request;
}


+ (NSURLRequest*) postRequestWithService:(NSString*)service
							  postString:(NSString*)postString {
	NSString* urlString = [kServerUrl stringByAppendingString:service];
	
	return [WebServiceManager postRequestWithUrlString:urlString postString:postString];
}

+ (NSMutableURLRequest*) postRequestWithUrlString:(NSString*)urlString
                                       postString:(NSString*)postString {
	NSData*	postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    return request;
}

#pragma mark - Send Request

+ (void) sendRequest:(NSURLRequest*)request
		  completion:(void (^)(NSData*, NSError*)) callback {
	if ([CustomUIUtils isConnectedToNetwork] == NO)
	{
		callback(nil, [NSError errorWithDomain:@"Network is not available!" code:0 userInfo:nil]);
		return;
	}

	_Assert(request);
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	
	[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse* response, NSData* responseData, NSError* error)
	 {
		 NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
		 NSUInteger responseStatusCode = [httpResponse statusCode];
		 if (responseStatusCode == 200)
         {
			 callback(responseData, error);
             [CustomUIUtils printLog:responseData];
         }
		 else
         {
			 callback(nil, error);
         }
		 
		 [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	 }];
}


+ (id) JSONData:(NSData*)data {
	_Assert(data);
    NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSError* error = nil;
    id response = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    if (error)
    {
       
    }
	return response;
}

@end
