//
//  AppDetailViewController.m
//  iTunes Search
//
//  Created by Maksim Romanov on 24.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppDetailViewController.h"
#import "AppDetailView.h"
#import "ITunesSearchService.h"
//#import "ImageDownloader.h"
#import <SDWebImage/SDWebImage.h>

@interface AppDetailViewController ()

@property (strong, nonatomic) AppDetailView *appDetailView;
@property (strong, nonatomic) ITunesApp *app;

@end

@implementation AppDetailViewController

- (instancetype)initWithApp:(ITunesApp *)app {
    self = [super init];
    if (self) {
        self.app = app;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDetailView = [[AppDetailView alloc] initWithFrame:self.view.frame];
    self.view = self.appDetailView;
    
    //self.appDetailView.appIconImageView.image = [ImageDownloader imageWithUrl:self.app.iconUrl];
    [self.appDetailView.appIconImageView sd_setImageWithURL:[NSURL URLWithString:self.app.iconUrl]
    placeholderImage:[UIImage systemImageNamed:@"questionmark.circle"]];

    self.appDetailView.appNameLabel.text = self.app.appName;
}


@end
