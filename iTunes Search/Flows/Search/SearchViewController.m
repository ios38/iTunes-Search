//
//  ViewController.m
//  iTunes Search
//
//  Created by Maksim Romanov on 22.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"

@interface SearchViewController ()

@property (strong, nonatomic) SearchView *searchView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchView = [[SearchView alloc] initWithFrame:self.view.frame];
    self.view = self.searchView;
}


@end
