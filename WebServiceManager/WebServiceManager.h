//
//  WebServiceManager.h
//  NetworkTestApp
//
//  Created by Waseem Ahmad on 22/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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


//+ (NSXMLElement*) xmlRootElement:(NSData*)data;
+ (id) JSONData:(NSData*)data;

@end
