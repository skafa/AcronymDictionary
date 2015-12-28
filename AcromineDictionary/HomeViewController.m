//
//  HomeViewController.m
//  AcromineDictionary
//
//  reated by Jo-Jo on 12/27/15.
//  Copyright © 2015 Jo-Jo Lin. All rights reserved.
//

#import "HomeViewController.h"
#import "NSDictionary+acronym.h"
#import "VariationTableViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *acronymSearchBar;
@property (weak, nonatomic) IBOutlet UITableView *longformsTableView;
@property (nonatomic,strong) NSArray *acronymList;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.acronymList)
        
        return [self.acronymList count];
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FullFormCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(self.acronymList){
        
        NSDictionary *acronym = [self.acronymList objectAtIndex:indexPath.row];
        cell.textLabel.text = [acronym longform];
        NSNumber *fre = [acronym frequency];
        NSNumber *since = [acronym since];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:NSLocalizedString(@"LongformsTableViewSubtitleText", @""),[[acronym since] stringValue], [[acronym frequency] stringValue]];
    }
    
    return cell;
}

#pragma mark- AcronymHTTPClientDelegate
-(void)AcronymHTTPClient:(AcronymHTTPClient *)client didFinishWithGetLongformsOfAbbreviation:(id)responseObject
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if(responseObject && [responseObject count] > 0){
        self.acronymList = responseObject;
        [self.longformsTableView reloadData];
        
    }else{
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"NoEntriesAlertTitle", @"") message:NSLocalizedString(@"NoEntriesAlertMessage", @"") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                             {
                                 [self resetSearchBarText];
                             }];
        
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    
    
}

-(void)AcronymHTTPClient:(AcronymHTTPClient *)client didFailWithGetDefinitionsOfAbbreviationError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark- UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [searchBar resignFirstResponder];
    
    //Add progress indicator
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    AcronymHTTPClient *client = [AcronymHTTPClient sharedAcronymHTTPClient];
    client.delegate = self;
    [client getLongFormsOfAbbreviation:searchBar.text];
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self resetTable];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self resetTable];
}

- (void)resetTable
{
    self.acronymList = nil;
    [self.longformsTableView reloadData];
}

- (void)resetSearchBarText
{
    self.acronymSearchBar.text = @"";
    [self.acronymSearchBar becomeFirstResponder];
}

#pragma mark - Segue to Variation View

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showVariation"]) {
        
        VariationTableViewController *variationsTableViewController = [segue destinationViewController];
        
        NSIndexPath *selectedIndex = [self.longformsTableView indexPathForSelectedRow];
        variationsTableViewController.variants = [[self.acronymList objectAtIndex:selectedIndex.row] variation];
    }
    
}
@end
