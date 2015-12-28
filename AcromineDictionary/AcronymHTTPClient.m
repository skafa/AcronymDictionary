//
//  AcronymHTTPClient.m
//  AcromineDictionary
//
//  reated by Jo-Jo on 12/27/15.
//  Copyright © 2015 Jo-Jo Lin. All rights reserved.
//

#import "AcronymHTTPClient.h"

@implementation AcronymHTTPClient

+ (AcronymHTTPClient *)sharedAcronymHTTPClient
{
    static AcronymHTTPClient * _sharedAcronymHTTPClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAcronymHTTPClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:AcromineRestApiBaseUrl]];
    });
    
    return _sharedAcronymHTTPClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url{
    
    self = [super initWithBaseURL:url];
    
    if(self){
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

- (void)getLongFormsOfAbbreviation:(NSString *)abbreviation{
    
    NSDictionary *parameters = @{SearchAcronymRequestParameter: abbreviation};
    
    self.responseSerializer.acceptableContentTypes = nil;
    
    [self GET:AcromineRestApiBaseUrl parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if([self.delegate respondsToSelector:@selector(AcronymHTTPClient:didFinishWithGetLongformsOfAbbreviation:)]){
            
            [self.delegate AcronymHTTPClient:self didFinishWithGetLongformsOfAbbreviation: [self parseLongformsList:responseObject]];
        }
        
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        if([self.delegate respondsToSelector:@selector(AcronymHTTPClient:didFailWithGetLongformsOfAbbreviationError:)]){
            [self.delegate AcronymHTTPClient:self didFailWithGetLongformsOfAbbreviationError:error];
        }
    }];
    
}

-(NSArray *)parseLongformsList:(id) responseObject {
    
    NSArray *longformsList = nil;
    
    if(responseObject && [responseObject count] > 0){
        
        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
        NSArray *responseArray  = [responseDictionary valueForKey:@"lfs"];
        
        if(responseArray && [responseArray count] > 0)
            longformsList = [responseArray objectAtIndex:0];
    }
    return longformsList;
}
@end

