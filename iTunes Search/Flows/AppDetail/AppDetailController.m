//
//  AppDetailController.m
//  iTunes Search
//
//  Created by Maksim Romanov on 24.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppDetailController.h"
#import "AppDetailHeaderController.h"
#import "AppDetailAlbumController.h"
#import "ITunesSearchService.h"
#import <SDWebImage/SDWebImage.h>
//#define MAS_SHORTHAND
#import "Masonry.h"

@interface AppDetailController ()

@property (strong, nonatomic) ITunesApp *app;
@property (strong, nonatomic) AppDetailHeaderController *appDetailHeaderController;
@property (strong, nonatomic) AppDetailAlbumController *appDetailAlbumController;

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
    [self addAppDetailAlbumController];
}

- (void)addAppDetailHeaderController {
    self.appDetailHeaderController = [[AppDetailHeaderController alloc] initWithApp:self.app andBlock:^{
        NSLog(@"Hello, i'm a block from AppDetail Controller!");
    }];
    [self addChildViewController:self.appDetailHeaderController];
    [self.view addSubview:self.appDetailHeaderController.view];
    [self.appDetailHeaderController didMoveToParentViewController:self];
    
    [self.appDetailHeaderController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.right.equalTo(self.view.mas_right).with.inset(20);
        make.top.equalTo(self.view.mas_topMargin).with.offset(20);
        make.height.mas_equalTo(100);
    }];
}

- (void)addAppDetailAlbumController {
    self.appDetailAlbumController = [[AppDetailAlbumController alloc] initWithApp:self.app];
    [self addChildViewController:self.appDetailAlbumController];
    [self.view addSubview:self.appDetailAlbumController.view];
    [self.appDetailAlbumController didMoveToParentViewController:self];
    
    [self.appDetailAlbumController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_topMargin).with.offset(140);
        make.height.mas_equalTo(270);
        
    }];
}

@end

