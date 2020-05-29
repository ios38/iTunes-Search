//
//  ViewController.m
//  iTunes Search
//
//  Created by Maksim Romanov on 22.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"
#import "ITunesSearchService.h"
#import "ITunesApp.h"
#import "AppDetailController.h"
#import "AppCell.h"

@interface SearchViewController ()

@property (strong, nonatomic) SearchView *searchView;
@property (strong,nonatomic) ITunesSearchService *searchService;
@property (strong,nonatomic) NSArray *searchResults;

@end

@implementation SearchViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.searchService = [[ITunesSearchService alloc] init];
        self.searchResults = [NSArray new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchView = [[SearchView alloc] initWithFrame:self.view.frame];
    self.view = self.searchView;
    self.searchView.tableView.delegate = self;
    self.searchView.tableView.dataSource = self;
    self.searchView.searchBar.delegate = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchResults count];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppCell"];
    if (!cell) {
        cell = [[AppCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"AppCell"];
    }
    ITunesApp *app = [self.searchResults objectAtIndex:indexPath.row];
    [cell configureWithApp:app];
    //cell.textLabel.text = app.appName;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", app.averageRating.doubleValue];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ITunesApp *app = [self.searchResults objectAtIndex:indexPath.row];
    AppDetailController *appDetailViewController = [[AppDetailController alloc] initWithApp:app];
    [self.navigationController pushViewController:appDetailViewController animated:YES];
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText  isEqual: @""]) {
        self.searchResults = @[];
        [self.searchView.tableView reloadData];

    } else {
        [self.searchService getAppsWithQuery:searchText
        onSuccess:^(NSArray * _Nonnull iTunesApps) {
            self.searchResults = iTunesApps;
            [self.searchView.tableView reloadData];
        }
        onFailure:^(NSError * _Nonnull error) {
            NSLog(@"error: %@", [error localizedDescription]);
        }];
    }
}

@end
