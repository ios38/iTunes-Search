//
//  AppDetailController.m
//  iTunes Search
//
//  Created by Maksim Romanov on 24.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppDetailController.h"
#import "AppDetailHeaderController.h"
#import "ITunesSearchService.h"
#import <SDWebImage/SDWebImage.h>

@interface AppDetailController ()

@property (strong, nonatomic) AppDetailHeaderController *appDetailHeaderController;
@property (strong, nonatomic) ITunesApp *app;

@end

@implementation AppDetailController

- (instancetype)initWithApp:(ITunesApp *)app {
    self = [super init];
    if (self) {
        self.app = app;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addAppDetailHeaderController];
}

- (void)addAppDetailHeaderController {
    self.appDetailHeaderController = [[AppDetailHeaderController alloc] initWithApp:self.app andBlock:^{
        NSLog(@"Hello, i'm a block!");
    }];

    self.appDetailHeaderController.view.frame = CGRectMake(0, 90, self.view.bounds.size.width, 150);
    [self addChildViewController:self.appDetailHeaderController];
    [self.view addSubview:self.appDetailHeaderController.view];
    [self.appDetailHeaderController didMoveToParentViewController:self];
}

@end

