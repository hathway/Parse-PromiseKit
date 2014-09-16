//
//  Parse+PromiseKit.h
//
//  Created by DJ Tarazona on 5/31/14.
//  Copyright (c) 2014 Hathway Inc.
//

#import <Foundation/Foundation.h>
#import <Parse.h>

@class PMKPromise;

@interface PFAnonymousUtils (PromiseKit)

/**
 Creates an anonymous user. Thens the `PFUser *`.
 @return A Promise that thens `PFUser *user`.
 */
+ (PMKPromise *)promiseLogIn;

@end


@interface PFCloud (PromiseKit)

/**
 Calls the given cloud function with the parameters passed in. Thens the result `id` object.
 @param function The function name to call.
 @param parameters The parameters to send to the function. Cannot be nil.
 @return A Promise that thens `id object`.
 */
+ (PMKPromise *)promiseFunction:(NSString *)function withParameters:(NSDictionary *)parameters;

@end


@interface PFFile (PromiseKit)

/**
 Gets the data from cache if available or fetches its contents from the Parse servers. Thens the
 `NSData *`.
 @return A Promise that thens `NSData *data`.
 */
- (PMKPromise *)promiseGetData;
/**
 This method is like promiseGetData but avoids ever holding the entire PFFile's contents in memory
 at once. This can help applications with many large PFFiles avoid memory warnings. Thens an
 `NSInputStream *` containing the data.
 @return A Promise that thens `NSInputStream *stream`.
 */
- (PMKPromise *)promiseGetDataStream;

/**
 Saves the file. Thens the saved `PFFile *`.
 @return A Promise that thens `PFFile *file`.
 */
- (PMKPromise *)promiseSave;

@end


@interface PFGeoPoint (PromiseKit)

/**
 Fetches the user's current location. Thens the `PFGeoPoint *`.
 @return A Promise that thens `PFGeoPoint *`.
 */
+ (PMKPromise *)promiseGeoPointForCurrentLocation;

@end


@interface PFObject (PromiseKit)

#if PARSE_IOS_ONLY
/**
 Refreshes the PFObject with the current data from the server. Thens the refreshed `PFObject *`.
 @return A Promise that thens `PFObject *object`.
 */
- (PMKPromise *)promiseRefresh;
#endif

/**
 Fetches the PFObject with the current data from the server. Thens the fetched `PFObject *`.
 @return A Promise that thens `PFObject *object`.
 */
- (PMKPromise *)promiseFetch;
/**
 Fetches the PFObject's data from the server if isDataAvailable is false. Thens the fetched `PFObject *`.
 @return A Promise that thens `PFObject *object`.
 */
- (PMKPromise *)promiseFetchIfNeeded;
/**
 Fetches all of the PFObjects with the current data from the server. Thens an `NSArray *` of the
 fetched `PFObject *`s.
 @param objects The list of objects to fetch.
 @return A Promise that thens an `NSArray *array` of `PFObject *object`s.
 */
+ (PMKPromise *)promiseFetchAll:(NSArray *)objects;
/**
 Fetches all of the PFObjects with the current data from the server if isDataAvailable is false.
 Thens an `NSArray *` of the fetched `PFObject *`s.
 @param objects The list of objects to fetch.
 @return A Promise that thens an `NSArray *array` of `PFObject *object`s.
 */
+ (PMKPromise *)promiseFetchAllIfNeeded:(NSArray *)objects;

/**
 Saves the PFObject. Thens the saved `PFObject *`.
 @return A Promise that thens `PFObject *object`.
 */
- (PMKPromise *)promiseSave;
/**
 Saves a collection of objects all at once. Thens an `NSArray *` of the saved `PFObject *`s.
 @param objects The array of objects to save.
 @return A Promise that thens an `NSArray *array` of `PFObject *object`s.
 */
+ (PMKPromise *)promiseSaveAll:(NSArray *)objects;

/**
 Deletes the PFObject. Thens the deleted `PFObject *`.
 @return A Promise that thens `PFObject *object`.
 */
- (PMKPromise *)promiseDelete;
/**
 Deletes a collection of objects all at once. Thens an `NSArray *` of the deleted `PFObject *`s.
 @param objects The array of objects to delete.
 @return A Promise that thens an `NSArray *array` of `PFObject *object`s.
 */
+ (PMKPromise *)promiseDeleteAll:(NSArray *)objects;

@end


@interface PFQuery (PromiseKit)

/**
 Gets the PFObject with the given class and id. Thens the fetched `PFObject *`.
 @param objectClass The class name for the object that is being requested.
 @param objectId The id of the object that is being requested.
 @return A Promise that thens `PFObject *object`.
 */
+ (PMKPromise *)promiseGetObjectOfClass:(NSString *)objectClass objectId:(NSString *)objectId;
/**
 Gets the PFObject with the given id. Thens the fetched `PFObject *`.
 @param objectId The id of the object that is being requested.
 @return A Promise that thens `PFObject *object`.
 */
- (PMKPromise *)promiseGetObjectWithId:(NSString *)objectId;
/**
 Gets the PFUser with the given id. Thens the fetched `PFUser *`.
 @param objectId The id of the user that is being requested.
 @return A Promise that thens `PFUser *user`.
 */
+ (PMKPromise *)promiseGetUserObjectWithId:(NSString *)objectId;

/**
 Finds objects based on the constructed query. Thens an `NSArray *` of the found `PFObject *`s.
 @return A Promise that thens an `NSArray *array` of `PFObject *object`s.
 */
- (PMKPromise *)promiseFindObjects;
/**
 Gets the first object based on the constructed query. Thens the fetched `PFObject *`.

 This mutates the PFQuery.
 @return A Promise that thens `PFObject *object`.
 */
- (PMKPromise *)promiseGetFirstObject;

/**
 Counts objects based on the constructed query. Thens the `NSNumber *` count.
 @return A Promise that thens `NSNumber *number`.
 */
- (PMKPromise *)promiseCountObjects;

@end


@interface PFUser (PromiseKit)

/**
 Signs up the user. Make sure that password and username are set. This will also enforce that the
 username isn't already taken. Thens the `PFUser *`.
 @return A Promise that thens `PFUser *user`.
 */
- (PMKPromise *)promiseSignUp;
/**
 Makes a request to become a user with the given session token. Thens the successfully logged in
 `PFUser *`. This also caches the user locally so that calls to currentUser will use the latest
 logged in user.
 @param sessionToken The session token for the user.
 @return A Promise that thens `PFUser *user`.
 */
+ (PMKPromise *)promiseBecome:(NSString *)sessionToken;
/**
 Makes a request to login a user with specified credentials. Thens the successfully logged in
 `PFUser *`. This also caches the user locally so that calls to currentUser will use the latest
 logged in user.
 @param username The username of the user.
 @param password The password of the user.
 @return A Promise that thens `PFUser *user`.
 */
+ (PMKPromise *)promiseLogInWithUsername:(NSString *)username password:(NSString *)password;
/**
 Send a password reset request for a specified email. If a user account exists with that email, an
 email will be sent to that address with instructions on how to reset their password. Thens the
 `NSString *` email.
 @param email Email of the account to send a reset password request.
 @return A Promise that thens `NSString *email`.
 */
+ (PMKPromise *)promiseRequestPasswordResetForEmail:(NSString *)email;

@end

#if PARSE_IOS_ONLY
@interface PFImageView (PromiseKit)

/**
 Initiate downloading of the remote image. Once the download completes, the remote image will be
 displayed. Thens the downloaded `UIImage *`.
 @return A Promise that thens `UIImage *image`.
 */
- (PMKPromise *)promiseLoad;

@end


@interface PFPurchase (PromiseKit)

/**
 Initiates the purchase for the product. Thens the `NSString *` product identifier.
 @param productIdentifier the product identifier.
 @return A Promise that thens `NSString *productIdentifier`.
 */
+ (PMKPromise *)promiseBuyProduct:(NSString *)productIdentifier;
/**
 Download the purchased asset, which is stored on Parse's server. Parse verifies the receipt with
 Apple and delivers the content only if the receipt is valid. Thens the `NSString *` file path.
 @param transaction the transaction, which contains the receipt.
 @return A Promise that thens `NSString *filePath`.
 */
+ (PMKPromise *)promiseDownloadAssetForTransaction:(SKPaymentTransaction *)transaction;

@end


@interface PFPush (PromiseKit)

/**
 Send a push message to a channel. Thens a succeeded `NSNumber *` boolean (always true).
 @param channel The channel to send to. The channel name must start with a letter and contain only
 letters, numbers, dashes, and underscores.
 @param message The message to send.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseSendPushMessageToChannel:(NSString *)channel withMessage:(NSString *)message;
/**
 Send a push message to a query. Thens a succeeded `NSNumber *` boolean (always true).
 @param query The query to send to. The query must be a PFInstallation query created with
 [PFInstallation query].
 @param message The message to send.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseSendPushMessageToQuery:(PFQuery *)query withMessage:(NSString *)message;
/**
 Send this push message. Thens a pushed `PFPush *`.
 @return A Promise that thens `PFPush *push`.
 */
- (PMKPromise *)promiseSendPush;

/**
 Send a push message with arbitrary data to a channel. See the guide for information about the
 dictionary structure. Thens a succeeded `NSNumber *` boolean (always true).
 @param channel The channel to send to. The channel name must start with a letter and contain only
 letters, numbers, dashes, and underscores.
 @param data The data to send.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseSendPushDataToChannel:(NSString *)channel withData:(NSDictionary *)data;
/**
 Send a push message with arbitrary data to a query. See the guide for information about the
 dictionary structure. Thens a succeeded `NSNumber *` boolean (always true).
 @param query The query to send to. The query must be a PFInstallation query created with
 [PFInstallation query].
 @param data The data to send.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseSendPushDataToQuery:(PFQuery *)query withData:(NSDictionary *)data;

/**
 Get all the channels that this device is subscribed to. Thens an `NSSet *` of the subscribed
 `NSString *` channel names.
 @return A Promise that thens an `NSSet *set` of `NSString *channel`s.
 */
+ (PMKPromise *)promiseGetSubscribedChannels;
/**
 Subscribes the device to a channel of push notifications. Thens a succeeded `NSNumber *` boolean
 (always true).
 @param channel The channel to subscribe to. The channel name must start with a letter and contain
 only letters, numbers, dashes, and underscores.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseSubscribeToChannel:(NSString *)channel;
/**
 Unsubscribes the device to a channel of push notifications. Thens a succeeded `NSNumber *` boolean
 (always true).
 @param channel The channel to unsubscribe from.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseUnsubscribeFromChannel:(NSString *)channel;

@end


@interface PFTwitterUtils (PromiseKit)

/**
 Logs in a user using Twitter. This method delegates to Twitter to authenticate the user, and then
 automatically logs in (or creates, in the case where it is a new user) a PFUser. Thens the
 successfully logged in `PFUser *`.
 @return A Promise that thens `PFUser *user`.
 */
+ (PMKPromise *)promiseLogIn;
/**
 Logs in a user using Twitter. Allows you to handle user login to Twitter, then provide
 authentication data to log in (or create, in the case where it is a new user) the PFUser. Thens the
 successfully logged in `PFUser *`.
 @param twitterId The id of the Twitter user being linked.
 @param screenName The screen name of the Twitter user being linked.
 @param authToken The auth token for the user's session.
 @param authTokenSecret The auth token secret for the user's session.
 @return A Promise that thens `PFUser *user`.
 */
+ (PMKPromise *)promiseLogInWithTwitterId:(NSString *)twitterId
                               screenName:(NSString *)screenName
                                authToken:(NSString *)authToken
                          authTokenSecret:(NSString *)authTokenSecret;

/**
 Links Twitter to an existing PFUser. This method delegates to Twitter to authenticate the user, and
 then automatically links the account to the PFUser. Thens a succeeded `NSNumber *` boolean (always
 true).
 @param user User to link to Twitter.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseLinkUser:(PFUser *)user;
/**
 Links Twitter to an existing PFUser. Allows you to handle user login to Twitter, then provide
 authentication data to link the account to the PFUser. Thens a succeeded `NSNumber *` boolean
 (always true).
 @param user User to link to Twitter.
 @param twitterId The id of the Twitter user being linked.
 @param screenName The screen name of the Twitter user being linked.
 @param authToken The auth token for the user's session.
 @param authTokenSecret The auth token secret for the user's session.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseLinkUser:(PFUser *)user
                      twitterId:(NSString *)twitterId
                     screenName:(NSString *)screenName
                      authToken:(NSString *)authToken
                authTokenSecret:(NSString *)authTokenSecret;

/**
 Unlinks the PFUser from a Twitter account. Thens a succeeded `NSNumber *` boolean (always true).
 @param user User to unlink from Twitter.
 @return A Promise that thens `NSNumber *succeededBool` (always true)`.
 */
+ (PMKPromise *)promiseUnlinkUser:(PFUser *)user;

@end

#endif