//
//  HomeViewController.h
//  AcromineDictionary
//
//  reated by Jo-Jo on 12/27/15.
//  Copyright © 2015 Jo-Jo Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AcronymHTTPClient.h"

@interface HomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate,AcronymHTTPClientDelegate>


@end

