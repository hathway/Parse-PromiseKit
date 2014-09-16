//
//  ParseFacebookUtils+PromiseKit.m
//
//  Created by DJ Tarazona on 9/16/14.
//  Copyright (c) 2014 Hathway Inc.
//

#import "ParseFacebookUtils+PromiseKit.h"
#import "PMKPFMacros.h"
#import <Promise.h>

@implementation PFFacebookUtils (PromiseKit)

+ (PMKPromise *)promiseLogInWithPermissions:(NSArray *)permissions
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self logInWithPermissions:permissions block:PMKPFUserResultBlock];
    }];
}

+ (PMKPromise *)promiseLogInWithFacebookId:(NSString *)facebookId
                            accessToken:(NSString *)accessToken
                         expirationDate:(NSDate *)expirationDate
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self logInWithFacebookId:facebookId
                      accessToken:accessToken
                   expirationDate:expirationDate
                            block:PMKPFUserResultBlock];
    }];
}

+ (PMKPromise *)promiseLinkUser:(PFUser *)user permissions:(NSArray *)permissions
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self linkUser:user permissions:permissions block:PMKPFBooleanResultBlock];
    }];
}

+ (PMKPromise *)promiseLinkUser:(PFUser *)user
                  facebookId:(NSString *)facebookId
                 accessToken:(NSString *)accessToken
              expirationDate:(NSDate *)expirationDate
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self linkUser:user
            facebookId:facebookId
           accessToken:accessToken
        expirationDate:expirationDate
                 block:PMKPFBooleanResultBlock];
    }];
}

+ (PMKPromise *)promiseUnlinkUser:(PFUser *)user
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self unlinkUserInBackground:user block:PMKPFBooleanResultBlock];
    }];
}

+ (PMKPromise *)promiseReauthorizeUser:(PFUser *)user
             withPublishPermissions:(NSArray *)permissions
                           audience:(FBSessionDefaultAudience)audience
{
    return [PMKPromise new:^(PMKPromiseFulfiller fulfiller, PMKPromiseRejecter rejecter) {
        [self reauthorizeUser:user
       withPublishPermissions:permissions
                     audience:audience
                        block:PMKPFBooleanResultBlock];
    }];
}

@end