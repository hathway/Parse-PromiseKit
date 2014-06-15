//
//  Parse+PromiseKit.h
//
//  Created by DJ Tarazona on 5/31/14.
//  Copyright (c) 2014 Hathway Inc. All rights reserved.
//

#import "Parse+PromiseKit.h"
#import <Promise.h>

#ifndef PKPFBooleanResultBlock
#define PKPFBooleanResultBlock \
^(BOOL succeeded, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(@(succeeded)); \
    } \
}
#endif

#ifndef PKPFBooleanResultBlockSelf
#define PKPFBooleanResultBlockSelf \
^(BOOL succeeded, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(self); \
    } \
}
#endif

#ifndef PKPFBooleanResultBlockArray
#define PKPFBooleanResultBlockArray \
^(BOOL succeeded, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(objects); \
    } \
}
#endif

#ifndef PKPFIntegerResultBlock
#define PKPFIntegerResultBlock \
^(int number, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(@(number)); \
    } \
}
#endif

#ifndef PKPFArrayResultBlock
#define PKPFArrayResultBlock \
^(NSArray *objects, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(objects); \
    } \
}
#endif

#ifndef PKPFObjectResultBlock
#define PKPFObjectResultBlock \
^(PFObject *object, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(object); \
    } \
}
#endif

#ifndef PKPFSetResultBlock
#define PKPFSetResultBlock \
^(NSSet *channels, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(channels); \
    } \
}
#endif

#ifndef PKPFUserResultBlock
#define PKPFUserResultBlock \
^(PFUser *user, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(user); \
    } \
}
#endif

#ifndef PKPFDataResultBlock
#define PKPFDataResultBlock \
^(NSData *data, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(data); \
    } \
}
#endif

#ifndef PKPFDataStreamResultBlock
#define PKPFDataStreamResultBlock \
^(NSInputStream *stream, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(stream); \
    } \
}
#endif

#ifndef PKPFStringResultBlock
#define PKPFStringResultBlock \
^(NSString *string, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(string); \
    } \
}
#endif

#ifndef PKPFIdResultBlock
#define PKPFIdResultBlock \
^(id object, NSError *error) { \
    if (error) { \
        rejecter(error); \
    } \
    else { \
        fulfiller(object); \
    } \
}
#endif

@implementation PFAnonymousUtils (PromiseKit)

+ (Promise *)promiseLogIn
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self logInWithBlock:PKPFUserResultBlock];
    }];
}

@end


@implementation PFCloud (PromiseKit)

+ (Promise *)promiseFunction:(NSString *)function withParameters:(NSDictionary *)parameters
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [PFCloud callFunctionInBackground:function withParameters:parameters block:PKPFIdResultBlock];
    }];
}

@end


@implementation PFFile (PromiseKit)

- (Promise *)promiseGetData
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self getDataInBackgroundWithBlock:PKPFDataResultBlock];
    }];
}

- (Promise *)promiseGetDataStream
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self getDataStreamInBackgroundWithBlock:PKPFDataStreamResultBlock];
    }];
}

- (Promise *)promiseSave
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self saveInBackgroundWithBlock:PKPFBooleanResultBlockSelf];
    }];
}

@end


@implementation PFGeoPoint (PromiseKit)

+ (Promise *)promiseGeoPointForCurrentLocation
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
            if (error) {
                rejecter(error);
            }
            else {
                fulfiller(geoPoint);
            }
        }];
    }];
}

@end


@implementation PFObject (PromiseKit)

#if PARSE_IOS_ONLY
- (Promise *)promiseRefresh
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self refreshInBackgroundWithBlock:PKPFObjectResultBlock];
    }];
}
#endif

- (Promise *)promiseFetch
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self fetchInBackgroundWithBlock:PKPFObjectResultBlock];
    }];
}

- (Promise *)promiseFetchIfNeeded
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self fetchIfNeededInBackgroundWithBlock:PKPFObjectResultBlock];
    }];
}

+ (Promise *)promiseFetchAll:(NSArray *)objects
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self fetchAllInBackground:objects block:PKPFArrayResultBlock];
    }];
}

+ (Promise *)promiseFetchAllIfNeeded:(NSArray *)objects
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self fetchAllIfNeededInBackground:objects block:PKPFArrayResultBlock];
    }];
}

- (Promise *)promiseSave
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self saveInBackgroundWithBlock:PKPFBooleanResultBlockSelf];
    }];
}

+ (Promise *)promiseSaveAll:(NSArray *)objects
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self saveAllInBackground:objects block:PKPFBooleanResultBlockArray];
    }];
}

- (Promise *)promiseDelete
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self deleteInBackgroundWithBlock:PKPFBooleanResultBlock];
    }];
}

+ (Promise *)promiseDeleteAll:(NSArray *)objects
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self deleteAllInBackground:objects block:PKPFBooleanResultBlock];
    }];
}

@end


@implementation PFQuery (PromiseKit)

+ (Promise *)promiseGetObjectOfClass:(NSString *)objectClass objectId:(NSString *)objectId
{
    return dispatch_promise(^id {
        NSError *error = nil;
        PFObject *object = [self getObjectOfClass:objectClass objectId:objectId error:&error];
        if ( ! object) {
            return error;
        }
        return object;
    });
}

- (Promise *)promiseGetObjectWithId:(NSString *)objectId
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self getObjectInBackgroundWithId:objectId block:PKPFObjectResultBlock];
    }];
}

+ (Promise *)promiseGetUserObjectWithId:(NSString *)objectId
{
    return dispatch_promise(^id {
        NSError *error = nil;
        PFUser *user = [self getUserObjectWithId:objectId error:&error];
        if ( ! user) {
            return error;
        }
        return user;
    });
}

- (Promise *)promiseFindObjects
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self findObjectsInBackgroundWithBlock:PKPFArrayResultBlock];
    }];
}

- (Promise *)promiseGetFirstObject
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self getFirstObjectInBackgroundWithBlock:PKPFObjectResultBlock];
    }];
}

- (Promise *)promiseCountObjects
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self countObjectsInBackgroundWithBlock:PKPFIntegerResultBlock];
    }];
}

@end


@implementation PFUser (PromiseKit)

- (Promise *)promiseSignUp
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self signUpInBackgroundWithBlock:PKPFBooleanResultBlockSelf];
    }];
}

+ (Promise *)promiseBecome:(NSString *)sessionToken
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self becomeInBackground:sessionToken block:PKPFUserResultBlock];
    }];
}

+ (Promise *)promiseLogInWithUsername:(NSString *)username password:(NSString *)password
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self logInWithUsernameInBackground:username password:password block:PKPFUserResultBlock];
    }];
}

+ (Promise *)promiseRequestPasswordResetForEmail:(NSString *)email
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self requestPasswordResetForEmailInBackground:email block:^(BOOL succeeded, NSError *error) {
            if (error) {
                rejecter(error);
            }
            else {
                fulfiller(email);
            }
        }];
    }];
}

@end


#if PARSE_IOS_ONLY
@implementation PFImageView (PromiseKit)

- (Promise *)promiseLoad
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self loadInBackground:^(UIImage *image, NSError *error) {
            if (error) {
                rejecter(error);
            }
            else {
                fulfiller(image);
            }
        }];
    }];
}

@end


@implementation PFPurchase (PromiseKit)

+ (Promise *)promiseBuyProduct:(NSString *)productIdentifier
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self buyProduct:productIdentifier block:^(NSError *error) {
            if (error) {
                rejecter(error);
            }
            else {
                fulfiller(productIdentifier);
            }
        }];
    }];
}

+ (Promise *)promiseDownloadAssetForTransaction:(SKPaymentTransaction *)transaction
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self downloadAssetForTransaction:transaction completion:PKPFStringResultBlock];
    }];
}

@end


@implementation PFPush (PromiseKit)

+ (Promise *)promiseSendPushMessageToChannel:(NSString *)channel withMessage:(NSString *)message
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self sendPushMessageToChannelInBackground:channel withMessage:message block:PKPFBooleanResultBlock];
    }];
}

+ (Promise *)promiseSendPushMessageToQuery:(PFQuery *)query withMessage:(NSString *)message
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self sendPushMessageToQueryInBackground:query withMessage:message block:PKPFBooleanResultBlock];
    }];
}

- (Promise *)promiseSendPush
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self sendPushInBackgroundWithBlock:PKPFBooleanResultBlockSelf];
    }];
}

+ (Promise *)promiseSendPushDataToChannel:(NSString *)channel withData:(NSDictionary *)data
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self sendPushDataToChannelInBackground:channel withData:data block:PKPFBooleanResultBlock];
    }];
}

+ (Promise *)promiseSendPushDataToQuery:(PFQuery *)query withData:(NSDictionary *)data
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self sendPushDataToQueryInBackground:query withData:data block:PKPFBooleanResultBlock];
    }];
}

+ (Promise *)promiseGetSubscribedChannels
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self getSubscribedChannelsInBackgroundWithBlock:PKPFSetResultBlock];
    }];
}

+ (Promise *)promiseSubscribeToChannel:(NSString *)channel
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self subscribeToChannelInBackground:channel block:PKPFBooleanResultBlock];
    }];
}

+ (Promise *)promiseUnsubscribeFromChannel:(NSString *)channel
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self unsubscribeFromChannelInBackground:channel block:PKPFBooleanResultBlock];
    }];
}

@end


@implementation PFTwitterUtils (PromiseKit)

+ (Promise *)promiseLogIn
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self logInWithBlock:PKPFUserResultBlock];
    }];
}

+ (Promise *)promiseLogInWithTwitterId:(NSString *)twitterId
                            screenName:(NSString *)screenName
                             authToken:(NSString *)authToken
                       authTokenSecret:(NSString *)authTokenSecret
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self logInWithTwitterId:twitterId
                      screenName:screenName
                       authToken:authToken
                 authTokenSecret:authTokenSecret
                           block:PKPFUserResultBlock];
    }];
}

+ (Promise *)promiseLinkUser:(PFUser *)user
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self linkUser:user block:PKPFBooleanResultBlock];
    }];
}

+ (Promise *)promiseLinkUser:(PFUser *)user
                   twitterId:(NSString *)twitterId
                  screenName:(NSString *)screenName
                   authToken:(NSString *)authToken
             authTokenSecret:(NSString *)authTokenSecret
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self linkUser:user
             twitterId:twitterId
            screenName:screenName
             authToken:authToken
       authTokenSecret:authTokenSecret
                 block:PKPFBooleanResultBlock];
    }];
}

+ (Promise *)promiseUnlinkUser:(PFUser *)user
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self unlinkUserInBackground:user block:PKPFBooleanResultBlock];
    }];
}

@end

#if defined(__has_include)
#if __has_include(<PFFacebookUtils.h>)
@implementation PFFacebookUtils (PromiseKit)

+ (Promise *)promiseLogInWithPermissions:(NSArray *)permissions
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self logInWithPermissions:permissions block:PKPFUserResultBlock];
    }];
}

+ (Promise *)promiseLogInWithFacebookId:(NSString *)facebookId
                            accessToken:(NSString *)accessToken
                         expirationDate:(NSDate *)expirationDate
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self logInWithFacebookId:facebookId
                      accessToken:accessToken
                   expirationDate:expirationDate
                            block:PKPFUserResultBlock];
    }];
}

+ (Promise *)promiseLinkUser:(PFUser *)user permissions:(NSArray *)permissions
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self linkUser:user permissions:permissions block:PKPFBooleanResultBlock];
    }];
}

+ (Promise *)promiseLinkUser:(PFUser *)user
                  facebookId:(NSString *)facebookId
                 accessToken:(NSString *)accessToken
              expirationDate:(NSDate *)expirationDate
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self linkUser:user
            facebookId:facebookId
           accessToken:accessToken
        expirationDate:expirationDate
                 block:PKPFBooleanResultBlock];
    }];
}

+ (Promise *)promiseUnlinkUser:(PFUser *)user
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self unlinkUserInBackground:user block:PKPFBooleanResultBlock];
    }];
}

+ (Promise *)promiseReauthorizeUser:(PFUser *)user
             withPublishPermissions:(NSArray *)permissions
                           audience:(FBSessionDefaultAudience)audience
{
    return [Promise new:^(PromiseFulfiller fulfiller, PromiseRejecter rejecter) {
        [self reauthorizeUser:user
       withPublishPermissions:permissions
                     audience:audience
                        block:PKPFBooleanResultBlock];
    }];
}

@end
#endif
#endif

#endif
