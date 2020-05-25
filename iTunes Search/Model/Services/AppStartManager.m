//
//  AppStartManager.m
//  iTunes Search
//
//  Created by Maksim Romanov on 22.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppStartManager.h"
#import "SearchViewController.h"
#import "SearchTableViewController.h"

@implementation AppStartManager

- (instancetype)initWithWindow:(UIWindow *)window {
    self = [super init];
    if (self) {
        self.window = window;
    }
    return self;
}

- (void)start {
    SearchViewController *vc = [[SearchViewController alloc] init];
    //SearchTableViewController *vc = [[SearchTableViewController alloc] init];

    vc.navigationItem.title = @"Search via iTunes";
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
}

@end
