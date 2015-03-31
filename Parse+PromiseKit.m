//
//  Parse+PromiseKit.m
//
//  Created by DJ Tarazona on 5/31/14.
//  Copyright (c) 2014 Hathway Inc.
//

#import "Parse+PromiseKit.h"
#import "PMKPFMacros.h"
#import <Promise.h>

@implementation PFAnonymousUtils (PromiseKit)

+ (PMKPromise *)promiseLogIn
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self logInWithBlock:PMKPFUserResultBlock];
    }];
}

@end


@implementation PFCloud (PromiseKit)

+ (PMKPromise *)promiseFunction:(NSString *)function withParameters:(NSDictionary *)parameters
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [PFCloud callFunctionInBackground:function withParameters:parameters block:PMKPFIdResultBlock];
    }];
}

@end


@implementation PFFile (PromiseKit)

- (PMKPromise *)promiseGetData
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self getDataInBackgroundWithBlock:PMKPFDataResultBlock];
    }];
}

- (PMKPromise *)promiseGetDataStream
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self getDataStreamInBackgroundWithBlock:PMKPFDataStreamResultBlock];
    }];
}

- (PMKPromise *)promiseSave
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self saveInBackgroundWithBlock:PMKPFBooleanResultBlockSelf];
    }];
}

@end


@implementation PFGeoPoint (PromiseKit)

+ (PMKPromise *)promiseGeoPointForCurrentLocation
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
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

- (PMKPromise *)promiseFetch
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self fetchInBackgroundWithBlock:PMKPFObjectResultBlock];
    }];
}

- (PMKPromise *)promiseFetchIfNeeded
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self fetchIfNeededInBackgroundWithBlock:PMKPFObjectResultBlock];
    }];
}

+ (PMKPromise *)promiseFetchAll:(NSArray *)objects
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self fetchAllInBackground:objects block:PMKPFArrayResultBlock];
    }];
}

+ (PMKPromise *)promiseFetchAllIfNeeded:(NSArray *)objects
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self fetchAllIfNeededInBackground:objects block:PMKPFArrayResultBlock];
    }];
}

- (PMKPromise *)promiseSave
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self saveInBackgroundWithBlock:PMKPFBooleanResultBlockSelf];
    }];
}

+ (PMKPromise *)promiseSaveAll:(NSArray *)objects
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self saveAllInBackground:objects block:PMKPFBooleanResultBlockArray];
    }];
}

- (PMKPromise *)promiseDelete
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self deleteInBackgroundWithBlock:PMKPFBooleanResultBlockSelf];
    }];
}

+ (PMKPromise *)promiseDeleteAll:(NSArray *)objects
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self deleteAllInBackground:objects block:PMKPFBooleanResultBlockArray];
    }];
}

@end


@implementation PFQuery (PromiseKit)

+ (PMKPromise *)promiseGetObjectOfClass:(NSString *)objectClass objectId:(NSString *)objectId
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

- (PMKPromise *)promiseGetObjectWithId:(NSString *)objectId
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self getObjectInBackgroundWithId:objectId block:PMKPFObjectResultBlock];
    }];
}

+ (PMKPromise *)promiseGetUserObjectWithId:(NSString *)objectId
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

- (PMKPromise *)promiseFindObjects
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self findObjectsInBackgroundWithBlock:PMKPFArrayResultBlock];
    }];
}

- (PMKPromise *)promiseGetFirstObject
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self getFirstObjectInBackgroundWithBlock:PMKPFObjectResultBlock];
    }];
}

- (PMKPromise *)promiseCountObjects
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self countObjectsInBackgroundWithBlock:PMKPFIntegerResultBlock];
    }];
}

@end


@implementation PFUser (PromiseKit)

- (PMKPromise *)promiseSignUp
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self signUpInBackgroundWithBlock:PMKPFBooleanResultBlockSelf];
    }];
}

+ (PMKPromise *)promiseBecome:(NSString *)sessionToken
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self becomeInBackground:sessionToken block:PMKPFUserResultBlock];
    }];
}

+ (PMKPromise *)promiseLogInWithUsername:(NSString *)username password:(NSString *)password
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self logInWithUsernameInBackground:username password:password block:PMKPFUserResultBlock];
    }];
}

+ (PMKPromise *)promiseRequestPasswordResetForEmail:(NSString *)email
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
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

- (PMKPromise *)promiseLoad
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
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

+ (PMKPromise *)promiseBuyProduct:(NSString *)productIdentifier
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
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

+ (PMKPromise *)promiseDownloadAssetForTransaction:(SKPaymentTransaction *)transaction
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self downloadAssetForTransaction:transaction completion:PMKPFStringResultBlock];
    }];
}

@end


@implementation PFPush (PromiseKit)

+ (PMKPromise *)promiseSendPushMessageToChannel:(NSString *)channel withMessage:(NSString *)message
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self sendPushMessageToChannelInBackground:channel withMessage:message block:PMKPFBooleanResultBlock];
    }];
}

+ (PMKPromise *)promiseSendPushMessageToQuery:(PFQuery *)query withMessage:(NSString *)message
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self sendPushMessageToQueryInBackground:query withMessage:message block:PMKPFBooleanResultBlock];
    }];
}

- (PMKPromise *)promiseSendPush
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self sendPushInBackgroundWithBlock:PMKPFBooleanResultBlockSelf];
    }];
}

+ (PMKPromise *)promiseSendPushDataToChannel:(NSString *)channel withData:(NSDictionary *)data
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self sendPushDataToChannelInBackground:channel withData:data block:PMKPFBooleanResultBlock];
    }];
}

+ (PMKPromise *)promiseSendPushDataToQuery:(PFQuery *)query withData:(NSDictionary *)data
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self sendPushDataToQueryInBackground:query withData:data block:PMKPFBooleanResultBlock];
    }];
}

+ (PMKPromise *)promiseGetSubscribedChannels
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self getSubscribedChannelsInBackgroundWithBlock:PMKPFSetResultBlock];
    }];
}

+ (PMKPromise *)promiseSubscribeToChannel:(NSString *)channel
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self subscribeToChannelInBackground:channel block:PMKPFBooleanResultBlock];
    }];
}

+ (PMKPromise *)promiseUnsubscribeFromChannel:(NSString *)channel
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self unsubscribeFromChannelInBackground:channel block:PMKPFBooleanResultBlock];
    }];
}

@end


@implementation PFTwitterUtils (PromiseKit)

+ (PMKPromise *)promiseLogIn
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self logInWithBlock:PMKPFUserResultBlock];
    }];
}

+ (PMKPromise *)promiseLogInWithTwitterId:(NSString *)twitterId
                            screenName:(NSString *)screenName
                             authToken:(NSString *)authToken
                       authTokenSecret:(NSString *)authTokenSecret
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self logInWithTwitterId:twitterId
                      screenName:screenName
                       authToken:authToken
                 authTokenSecret:authTokenSecret
                           block:PMKPFUserResultBlock];
    }];
}

+ (PMKPromise *)promiseLinkUser:(PFUser *)user
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self linkUser:user block:PMKPFBooleanResultBlock];
    }];
}

+ (PMKPromise *)promiseLinkUser:(PFUser *)user
                   twitterId:(NSString *)twitterId
                  screenName:(NSString *)screenName
                   authToken:(NSString *)authToken
             authTokenSecret:(NSString *)authTokenSecret
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self linkUser:user
             twitterId:twitterId
            screenName:screenName
             authToken:authToken
       authTokenSecret:authTokenSecret
                 block:PMKPFBooleanResultBlock];
    }];
}

+ (PMKPromise *)promiseUnlinkUser:(PFUser *)user
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self unlinkUserInBackground:user block:PMKPFBooleanResultBlock];
    }];
}

@end

#endif
