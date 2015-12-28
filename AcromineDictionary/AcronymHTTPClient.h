//
//  AcronymHTTPClient.h
//  AcromineDictionary
//
//  reated by Jo-Jo on 12/27/15.
//  Copyright © 2015 Jo-Jo Lin. All rights reserved.
//

#import "AcronymHTTPClientDelegate.h"

@interface AcronymHTTPClient : AFHTTPSessionManager

@property (nonatomic, weak) id<AcronymHTTPClientDelegate> delegate;

/**
 Creates a class method that returns a shared singleton instance of AcronymHTTPClient, AFHTTPSessionManager subclass.
 */
+ (AcronymHTTPClient *)sharedAcronymHTTPClient;

/**
 Initial base url with Acromine Rest API url
 http://www.nactem.ac.uk/software/acromine/dictionary.py
 */
- (instancetype)initWithBaseURL:(NSURL *)url;

/**
 Fetch abbreviation longforms
 */
- (void)getLongFormsOfAbbreviation:(NSString *)abbreviation;

@end
