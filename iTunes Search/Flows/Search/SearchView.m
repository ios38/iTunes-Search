//
//  SearchView.m
//  iTunes Search
//
//  Created by Maksim Romanov on 22.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "SearchView.h"

@interface SearchView ()

@end

@implementation SearchView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureUI];
    }
    return self;
}

- (void)configureUI {
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 95, self.bounds.size.width, 40)];
    searchBar.placeholder = @"type here";
    [self addSubview:searchBar];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 140, self.bounds.size.width, self.bounds.size.height - 180)];
    //self.tableView.dataSource = self;
    //self.tableView.delegate = self;
    [self addSubview:self.tableView];
    
}

@end
