//
//  ParseFacebookUtils+PromiseKit.h
//
//  Created by DJ Tarazona on 9/16/14.
//  Copyright (c) 2014 Hathway Inc.
//

#import <Foundation/Foundation.h>
#import <PFFacebookUtils.h>

@class PMKPromise;

@interface PFFacebookUtils (PromiseKit)

/**
 Logs in a user using Facebook. This method delegates to the Facebook SDK to authenticate the user,
 and then automatically logs in (or creates, in the case where it is a new user) a PFUser. Thens the
 successfully logged in `PFUser *`.
 @param permissions The permissions required for Facebook log in. This passed to the authorize
 method on the Facebook instance.
 @return A Promise that thens `PFUser *user`.
 */
+ (PMKPromise *)promiseLogInWithPermissions:(NSArray *)permissions;
/**
 Logs in a user using Facebook. Allows you to handle user login to Facebook, then provide
 authentication data to log in (or create, in the case where it is a new user) the PFUser. Thens the
 successfully logged in `PFUser *`.
 @param facebookId The id of the Facebook user being linked.
 @param accessToken The access token for the user's session.
 @param expirationDate The expiration date for the access token.
 @return A Promise that thens `PFUser *user`.
 */
+ (PMKPromise *)promiseLogInWithFacebookId:(NSString *)facebookId
                               accessToken:(NSString *)accessToken
                            expirationDate:(NSDate *)expirationDate;

/**
 Links Facebook to an existing PFUser. This method delegates to the Facebook SDK to authenticate
 the user, and then automatically links the account to the PFUser. Thens a succeeded `NSNumber *`
 boolean (always true).
 @param user User to link to Facebook.
 @param permissions The permissions required for Facebook log in. This passed to the authorize
 method on the Facebook instance.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseLinkUser:(PFUser *)user permissions:(NSArray *)permissions;
/**
 Links Facebook to an existing PFUser. Allows you to handle user login to Facebook, then provide
 authentication data to link the account to the PFUser. Thens a succeeded `NSNumber *` boolean
 (always true).
 @param user User to link to Facebook.
 @param facebookId The id of the Facebook user being linked.
 @param accessToken The access token for the user's session.
 @param expirationDate The expiration date for the access token.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseLinkUser:(PFUser *)user
                     facebookId:(NSString *)facebookId
                    accessToken:(NSString *)accessToken
                 expirationDate:(NSDate *)expirationDate;

/**
 Unlinks the PFUser from a Facebook account. Thens a succeeded `NSNumber *` boolean (always true).
 @param user User to unlink from Facebook.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseUnlinkUser:(PFUser *)user;

/**
 Requests new Facebook publish permissions for the given user.  This may prompt the user to
 reauthorize the application. The user will be saved as part of this operation. Thens a succeeded
 `NSNumber *` boolean (always true).
 @param user User to request new permissions for. The user must be linked to Facebook.
 @param permissions The new publishing permissions to request.
 @param audience The default audience for publishing permissions to request.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseReauthorizeUser:(PFUser *)user
                withPublishPermissions:(NSArray *)permissions
                              audience:(FBSessionDefaultAudience)audience;

@end
