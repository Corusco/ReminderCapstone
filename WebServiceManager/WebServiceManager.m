//
//  WebServiceManager.m
//  NetworkTestApp
//
//  Created by Waseem Ahmad on 22/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "WebServiceManager.h"
#import "Defines.h"
#import "UIPrefix.h"
#import <UIKit/UIKit.h>
#import "CustomUIUtils.h"

@implementation WebServiceManager

+ (NSURLRequest*) requestWithService:(NSString*)service
{
	NSString* urlString = [kServerUrl stringByAppendingString:service];
	return [WebServiceManager requestWithUrlString:urlString];
}

+ (NSMutableURLRequest*) requestWithUrlString:(NSString*)urlString // in case base url are not same
{
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
	
//	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	
	//    [request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    return (NSMutableURLRequest*)request;
}

+ (NSURLRequest*) postRequestWithService:(NSString*)service
							  postString:(NSString*)postString
{
	NSString* urlString = [kServerUrl stringByAppendingString:service];
	
	return [WebServiceManager postRequestWithUrlString:urlString postString:postString];
}

+ (NSMutableURLRequest*) postRequestWithUrlString:(NSString*)urlString
								postString:(NSString*)postString
{
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
		  completion:(void (^)(NSData*, NSError*)) callback
{
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

//+ (NSXMLElement*) xmlRootElement:(NSData*)data
//{
//	_Assert(data);
//	
//	NSXMLDocument* xmlDoc = [[[NSXMLDocument alloc] initWithData:data options:0 error:nil] autorelease];
//	return (xmlDoc) ? [xmlDoc rootElement] : nil;
//}

+ (id) JSONData:(NSData*)data
{
	_Assert(data);
    NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    // str = [str stringByReplacingOccurrencesOfString:@"NaN" withString:@"0.0"];

    NSError* error = nil;
    id response = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    if (error)
    {
       // DLog(@"%@", [error description]);
    }
	return response;
}

@end
