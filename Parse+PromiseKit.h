//
//  Parse+PromiseKit.h
//
//  Created by DJ Tarazona on 5/31/14.
//  Copyright (c) 2014 Hathway Inc.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@class PMKPromise;

@interface PFAnonymousUtils (PromiseKit)

+ (PMKPromise *)promiseLogIn;

@end


@interface PFCloud (PromiseKit)

+ (PMKPromise *)promiseFunction:(NSString *)function withParameters:(NSDictionary *)parameters;

@end


@interface PFFile (PromiseKit)

- (PMKPromise *)promiseGetData;
- (PMKPromise *)promiseGetDataStream;

- (PMKPromise *)promiseSave;

@end


@interface PFGeoPoint (PromiseKit)

+ (PMKPromise *)promiseGeoPointForCurrentLocation;

@end


@interface PFObject (PromiseKit)

#if PARSE_IOS_ONLY
- (PMKPromise *)promiseRefresh;
#endif

- (PMKPromise *)promiseFetch;
- (PMKPromise *)promiseFetchIfNeeded;
+ (PMKPromise *)promiseFetchAll:(NSArray *)objects;
+ (PMKPromise *)promiseFetchAllIfNeeded:(NSArray *)objects;

- (PMKPromise *)promiseSave;
+ (PMKPromise *)promiseSaveAll:(NSArray *)objects;

- (PMKPromise *)promiseDelete;
+ (PMKPromise *)promiseDeleteAll:(NSArray *)objects;

@end


@interface PFQuery (PromiseKit)

+ (PMKPromise *)promiseGetObjectOfClass:(NSString *)objectClass objectId:(NSString *)objectId;
- (PMKPromise *)promiseGetObjectWithId:(NSString *)objectId;
+ (PMKPromise *)promiseGetUserObjectWithId:(NSString *)objectId;
- (PMKPromise *)promiseFindObjects;
- (PMKPromise *)promiseGetFirstObject;
- (PMKPromise *)promiseCountObjects;

@end


@interface PFUser (PromiseKit)

- (PMKPromise *)promiseSignUp;
+ (PMKPromise *)promiseBecome:(NSString *)sessionToken;
+ (PMKPromise *)promiseLogInWithUsername:(NSString *)username password:(NSString *)password;
+ (PMKPromise *)promiseRequestPasswordResetForEmail:(NSString *)email;

@end

#if PARSE_IOS_ONLY
@interface PFImageView (PromiseKit)

- (PMKPromise *)promiseLoad;

@end


@interface PFPurchase (PromiseKit)

+ (PMKPromise *)promiseBuyProduct:(NSString *)productIdentifier;
+ (PMKPromise *)promiseDownloadAssetForTransaction:(SKPaymentTransaction *)transaction;

@end


@interface PFPush (PromiseKit)

+ (PMKPromise *)promiseSendPushMessageToChannel:(NSString *)channel withMessage:(NSString *)message;
+ (PMKPromise *)promiseSendPushMessageToQuery:(PFQuery *)query withMessage:(NSString *)message;

- (PMKPromise *)promiseSendPush;

+ (PMKPromise *)promiseSendPushDataToChannel:(NSString *)channel withData:(NSDictionary *)data;
+ (PMKPromise *)promiseSendPushDataToQuery:(PFQuery *)query withData:(NSDictionary *)data;

+ (PMKPromise *)promiseGetSubscribedChannels;
+ (PMKPromise *)promiseSubscribeToChannel:(NSString *)channel;
+ (PMKPromise *)promiseUnsubscribeFromChannel:(NSString *)channel;

@end


@interface PFTwitterUtils (PromiseKit)

+ (PMKPromise *)promiseLogIn;
+ (PMKPromise *)promiseLogInWithTwitterId:(NSString *)twitterId
                            screenName:(NSString *)screenName
                             authToken:(NSString *)authToken
                       authTokenSecret:(NSString *)authTokenSecret;

+ (PMKPromise *)promiseLinkUser:(PFUser *)user;
+ (PMKPromise *)promiseLinkUser:(PFUser *)user
                   twitterId:(NSString *)twitterId
                  screenName:(NSString *)screenName
                   authToken:(NSString *)authToken
             authTokenSecret:(NSString *)authTokenSecret;

+ (PMKPromise *)promiseUnlinkUser:(PFUser *)user;

@end

#if defined(__has_include)
#if __has_include(<PFFacebookUtils.h>)
@interface PFFacebookUtils (PromiseKit)

+ (PMKPromise *)promiseLogInWithPermissions:(NSArray *)permissions;
+ (PMKPromise *)promiseLogInWithFacebookId:(NSString *)facebookId
                            accessToken:(NSString *)accessToken
                         expirationDate:(NSDate *)expirationDate;

+ (PMKPromise *)promiseLinkUser:(PFUser *)user permissions:(NSArray *)permissions;
+ (PMKPromise *)promiseLinkUser:(PFUser *)user
                  facebookId:(NSString *)facebookId
                 accessToken:(NSString *)accessToken
              expirationDate:(NSDate *)expirationDate;

+ (PMKPromise *)promiseUnlinkUser:(PFUser *)user;

+ (PMKPromise *)promiseReauthorizeUser:(PFUser *)user
             withPublishPermissions:(NSArray *)permissions
                           audience:(FBSessionDefaultAudience)audience;

@end
#endif
#endif

#endif
