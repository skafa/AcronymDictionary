//
//  VariationTableViewController.m
//  AcromineDictionary
//
//  reated by Jo-Jo on 12/27/15.
//  Copyright © 2015 Jo-Jo Lin. All rights reserved.
//

#import "VariationTableViewController.h"
#import "NSDictionary+acronym.h"

@interface VariationTableViewController ()

@end

@implementation VariationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([self.variants count]>0) {
        return [self.variants count];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"VariantionFullForm";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(self.variants){
        NSDictionary *acronym = [self.variants objectAtIndex:indexPath.row];
        cell.textLabel.text = [acronym longform];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:NSLocalizedString(@"LongformsTableViewSubtitleText", @""),[[acronym since] stringValue], [[acronym frequency] stringValue]];
        
    }
    
    return cell;
}


@end
