//
//  NSDictionary+acronym.h
//  AcromineDictionary
//
//  reated by Jo-Jo on 12/27/15.
//  Copyright © 2015 Jo-Jo Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @brief NSDictionary category methods to get acronym value types.
 *
 */
@interface NSDictionary (acronym)

/**
 Representative form of the full form.
 */
- (NSString *)longform;

/**
 The number of occurrences of the definition in the corpus.
 */
- (NSNumber *)frequency;

/**
 The year when the definition appeared for the first time in the corpus.
 */
- (NSNumber *)since;

/**
 An array of variation objects that gather surface expressions of the full form in the corpus.
 */
- (NSArray *)variation;

@end
