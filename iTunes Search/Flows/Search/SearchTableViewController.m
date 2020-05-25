//
//  SearchTableViewController.m
//  iTunes Search
//
//  Created by Maksim Romanov on 25.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "SearchTableViewController.h"
#import "ITunesSearchService.h"
#import "ITunesApp.h"
#import "AppCell.h"

@interface SearchTableViewController ()

@property (strong,nonatomic) ITunesSearchService *searchService;
@property (strong,nonatomic) NSArray *searchResults;

@end

@implementation SearchTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.searchService = [[ITunesSearchService alloc] init];
        self.searchResults = [NSArray new];
        [self.searchService getAppsWithQuery:@"telegram"
        onSuccess:^(NSArray * _Nonnull iTunesApps) {
            self.searchResults = iTunesApps;
            [self.tableView reloadData];
        }
        onFailure:^(NSError * _Nonnull error) {
            NSLog(@"error: %@", [error localizedDescription]);
        }];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppCell"];
    if (!cell) {
        cell = [[AppCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"AppCell"];
    }
    ITunesApp *app = [self.searchResults objectAtIndex:indexPath.row];
    [cell configureWithApp:app];
    return cell;
}

@end
