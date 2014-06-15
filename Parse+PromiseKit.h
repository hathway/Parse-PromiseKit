//
//  Parse+PromiseKit.h
//
//  Created by DJ Tarazona on 5/31/14.
//  Copyright (c) 2014 Hathway Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@class Promise;

@interface PFAnonymousUtils (PromiseKit)

+ (Promise *)promiseLogIn;

@end


@interface PFCloud (PromiseKit)

+ (Promise *)promiseFunction:(NSString *)function withParameters:(NSDictionary *)parameters;

@end


@interface PFFile (PromiseKit)

- (Promise *)promiseGetData;
- (Promise *)promiseGetDataStream;

- (Promise *)promiseSave;

@end


@interface PFGeoPoint (PromiseKit)

+ (Promise *)promiseGeoPointForCurrentLocation;

@end


@interface PFObject (PromiseKit)

#if PARSE_IOS_ONLY
- (Promise *)promiseRefresh;
#endif

- (Promise *)promiseFetch;
- (Promise *)promiseFetchIfNeeded;
+ (Promise *)promiseFetchAll:(NSArray *)objects;
+ (Promise *)promiseFetchAllIfNeeded:(NSArray *)objects;

- (Promise *)promiseSave;
+ (Promise *)promiseSaveAll:(NSArray *)objects;

- (Promise *)promiseDelete;
+ (Promise *)promiseDeleteAll:(NSArray *)objects;

@end


@interface PFQuery (PromiseKit)

+ (Promise *)promiseGetObjectOfClass:(NSString *)objectClass objectId:(NSString *)objectId;
- (Promise *)promiseGetObjectWithId:(NSString *)objectId;
+ (Promise *)promiseGetUserObjectWithId:(NSString *)objectId;
- (Promise *)promiseFindObjects;
- (Promise *)promiseGetFirstObject;
- (Promise *)promiseCountObjects;

@end


@interface PFUser (PromiseKit)

- (Promise *)promiseSignUp;
+ (Promise *)promiseBecome:(NSString *)sessionToken;
+ (Promise *)promiseLogInWithUsername:(NSString *)username password:(NSString *)password;
+ (Promise *)promiseRequestPasswordResetForEmail:(NSString *)email;

@end

#if PARSE_IOS_ONLY
@interface PFImageView (PromiseKit)

- (Promise *)promiseLoad;

@end


@interface PFPurchase (PromiseKit)

+ (Promise *)promiseBuyProduct:(NSString *)productIdentifier;
+ (Promise *)promiseDownloadAssetForTransaction:(SKPaymentTransaction *)transaction;

@end


@interface PFPush (PromiseKit)

+ (Promise *)promiseSendPushMessageToChannel:(NSString *)channel withMessage:(NSString *)message;
+ (Promise *)promiseSendPushMessageToQuery:(PFQuery *)query withMessage:(NSString *)message;

- (Promise *)promiseSendPush;

+ (Promise *)promiseSendPushDataToChannel:(NSString *)channel withData:(NSDictionary *)data;
+ (Promise *)promiseSendPushDataToQuery:(PFQuery *)query withData:(NSDictionary *)data;

+ (Promise *)promiseGetSubscribedChannels;
+ (Promise *)promiseSubscribeToChannel:(NSString *)channel;
+ (Promise *)promiseUnsubscribeFromChannel:(NSString *)channel;

@end


@interface PFTwitterUtils (PromiseKit)

+ (Promise *)promiseLogIn;
+ (Promise *)promiseLogInWithTwitterId:(NSString *)twitterId
                            screenName:(NSString *)screenName
                             authToken:(NSString *)authToken
                       authTokenSecret:(NSString *)authTokenSecret;

+ (Promise *)promiseLinkUser:(PFUser *)user;
+ (Promise *)promiseLinkUser:(PFUser *)user
                   twitterId:(NSString *)twitterId
                  screenName:(NSString *)screenName
                   authToken:(NSString *)authToken
             authTokenSecret:(NSString *)authTokenSecret;

+ (Promise *)promiseUnlinkUser:(PFUser *)user;

@end

#if defined(__has_include)
#if __has_include(<PFFacebookUtils.h>)
@interface PFFacebookUtils (PromiseKit)

+ (Promise *)promiseLogInWithPermissions:(NSArray *)permissions;
+ (Promise *)promiseLogInWithFacebookId:(NSString *)facebookId
                            accessToken:(NSString *)accessToken
                         expirationDate:(NSDate *)expirationDate;

+ (Promise *)promiseLinkUser:(PFUser *)user permissions:(NSArray *)permissions;
+ (Promise *)promiseLinkUser:(PFUser *)user
                  facebookId:(NSString *)facebookId
                 accessToken:(NSString *)accessToken
              expirationDate:(NSDate *)expirationDate;

+ (Promise *)promiseUnlinkUser:(PFUser *)user;

+ (Promise *)promiseReauthorizeUser:(PFUser *)user
             withPublishPermissions:(NSArray *)permissions
                           audience:(FBSessionDefaultAudience)audience;

@end
#endif
#endif

#endif
