//
//  Defines.h
//  
//
//  Created by Justin Huntington on 6/10/15.
//
//

#ifndef _Defines_h
#define _Defines_h

//****Network****
#define kServerUrl @"http://basf.3pcmedia.com/api/?"

//****Instagram****
#pragma mark - Instagram BASE

#define kInstagramBaseURL @"https://instagram.com/"
#define kInstagramAPIBaseURL @"https://api.instagram.com"
#define kInstagramAuthenticationURL @"oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token&scope=likes+comments+basic"
#define kInstagramClientID @"e1d2dfa004db483aa3ec1f201000cd20"
#define kInstagramRedirectURI @"http://www.ourcavalcade.com"
#define kInstagramAccessToken @"access_token="

#pragma mark - Instagram API USER

#define kInstagramUserEndpoint @"/v1/users/%@/?%@" //use with userID and access token keys. may use self for key owner
#define kInstagramUserFeed @"/v1/users/self/feed?%@" //use with access token key
#define kInstagramUserPostFeed @"/v1/users/%@/media/recent/?%@" //use with a user ID and access token key. may use self for owner
#define kInstagramUserSearch @"/v1/users/search?q=%@&%@" //use with a user ID to search and access token



//****Facebook****
#pragma mark - Facebook

#define kFacebookBaseURL @""
#define kFacebookAPIBaseURL @""
#define kFacebookAuthenticationURL @""
#define kFacebookClientID @""
#define kFacebookRedirectURI @""

#endif
