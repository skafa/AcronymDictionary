//
//  AcronymHTTPClientDelegate.h
//  AcromineDictionary
//
//  reated by Jo-Jo on 12/27/15.
//  Copyright © 2015 Jo-Jo Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AcronymHTTPClient;

@protocol AcronymHTTPClientDelegate <NSObject>

@optional

/**
 Delegate method - it can notify a controller that the data has been received.
 */
-(void)AcronymHTTPClient:(AcronymHTTPClient *)client didFinishWithGetLongformsOfAbbreviation:(id)responseObject;

/**
 Delegate method - it can notify a controller that request error occurs.
 */
-(void)AcronymHTTPClient:(AcronymHTTPClient *)client didFailWithGetLongformsOfAbbreviationError:(NSError *)error;


@end
