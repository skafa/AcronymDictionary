//
//  AppConstants.m
//  AcromineDictionary
//
//  reated by Jo-Jo on 12/27/15.
//  Copyright © 2015 Jo-Jo Lin. All rights reserved.
//

#import "AppConstants.h"

/**
HTTP GET request URL - to obtain abbreviation definitions
*/
NSString * const AcromineRestApiBaseUrl = @"http://www.nactem.ac.uk/software/acromine/dictionary.py?";

/**
 Request parameter for which Abbreviation definitions are to be retrieved.
 */
NSString * const SearchAcronymRequestParameter = @"sf";

@implementation AppConstants

@end
