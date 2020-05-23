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

@interface SearchViewController ()

@property (strong,nonatomic) ITunesSearchService *searchService;

@end

@implementation SearchViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.searchService = [[ITunesSearchService alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchView = [[SearchView alloc] initWithFrame:self.view.frame];
    self.view = self.searchView;
    self.searchView.searchBar.delegate = self;
    self.searchView.tableView.delegate = self;
    self.searchView.tableView.dataSource = self;
    [self getApps];
}

- (void)getApps {
    [self.searchService getAppsWithQuery:@"telegram"
    onSuccess:^(NSArray * _Nonnull iTunesApps) {
        ITunesApp *app = iTunesApps.firstObject;
        NSLog(@"app: %@, rating: %@", app.appName, app.averageRating);
    }
    onFailure:^(NSError * _Nonnull error) {
        NSLog(@"error: %@", [error localizedDescription]);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld",(long)indexPath.row ];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath: %ld", (long)indexPath.row);
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText  isEqual: @""]) {
        
    } else {
        
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"SearchBar.text: %@", self.searchView.searchBar.text);

}

@end
