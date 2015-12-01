//
//  Defines.h
//  
//
//  Created by Justin Huntington on 6/10/15.
//
//

#import <Foundation/Foundation.h>

#ifndef _Defines_h
#define _Defines_h

//****Network****
#define kServerUrl @"http://basf.3pcmedia.com/api/?"

//****UserInterface*****
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

static NSString * const kInstagramSearchFinished = @"instagramSearchFinished";
static NSString * const kInstagramLoginFinished = @"instagramLoginFinished";
static NSString * const kThemeQueryFinished = @"ThemeQueryFinished";
static NSString * const kThemesAssigned = @"ThemesAssigned";
static NSString * const kTodayString = @"Today";
static NSString * const kYesterdayString = @"Yesterday";
static NSString * const kDayBeforeString = @"DayBefore";
static NSString * const kPageViewWillTransition = @"pageViewWillTransition";

//****Instagram API****
#pragma mark - Instagram BASE

static NSString * const kInstagramBaseURL = @"https://instagram.com";
#define kInstagramAPIBaseURL @"https://api.instagram.com"
#define kInstagramAuthenticationURL @"oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token&scope=likes+comments+basic"
#define kInstagramClientID @"e1d2dfa004db483aa3ec1f201000cd20"
#define kInstagramRedirectURI @"http://www.ourcavalcade.com"
#define kInstagramAccessTokenRange @"access_token="

#pragma mark - Instagram API USER

#define kInstagramUserEndpoint @"/v1/users/%@/?%@" //use with userID and access token keys. may use self for key owner
#define kInstagramUserFeed @"/v1/users/self/feed" //use with access token key
#define kInstagramUserPostFeed @"/v1/users/%@/media/recent/?%@" //use with a user ID and access token key. may use self for owner
#define kInstagramUserSearch @"/v1/users/search?q=%@&%@" //use with a user ID to search and access token

#pragma mark - Instagram Tag Requests

#define kInstagramSearchTag @"/v1/tags/%@/media/recent" //get all photos with a given tag


//****Facebook****
#pragma mark - Facebook

#define kFacebookBaseURL @""
#define kFacebookAPIBaseURL @""
#define kFacebookAuthenticationURL @""
#define kFacebookClientID @""
#define kFacebookRedirectURI @""

#endif
