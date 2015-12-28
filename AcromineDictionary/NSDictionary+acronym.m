//
//  NSDictionary+acronym.m
//  AcromineDictionary
//
//  reated by Jo-Jo on 12/27/15.
//  Copyright © 2015 Jo-Jo Lin. All rights reserved.
//

#import "NSDictionary+acronym.h"

@implementation NSDictionary (acronym)

- (NSString *)longform
{
    return self[@"lf"];
}

- (NSNumber *)frequency{
    return self[@"freq"];
}

- (NSNumber *)since;
{
    return self[@"since"];
}

- (NSArray *)variation{
    
    return self[@"vars"];
}

@end
