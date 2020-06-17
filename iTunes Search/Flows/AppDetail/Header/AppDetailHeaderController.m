//
//  AppDetailHeaderController.m
//  iTunes Search
//
//  Created by Maksim Romanov on 28.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppDetailHeaderController.h"
#import "AppDetailHeaderView.h"
#import <SDWebImage/SDWebImage.h>
#import "AppHeaderModel.h"


@interface AppDetailHeaderController ()

@property (strong, nonatomic) AppDetailHeaderView *appDetailHeaderView;
@property (strong, nonatomic) ITunesApp *app;

@property (strong,nonatomic) id <AppHeaderModelInput, AppHeaderModelOutput> appHeaderModel;

@end

@implementation AppDetailHeaderController

@synthesize block;

- (instancetype)initWithApp:(ITunesApp *)app andBlock:(void(^_Nullable)(void))block {
    self = [super init];
    if (self) {
        self.app = app;
        self.block = block;
        //NSLog(@"init self.app: %@",self.app.appName);
    }
    return self;
}

- (void)loadView {
    [super loadView];
    //NSLog(@"loadView self.app: %@",self.app.appName);
    //self.appDetailHeaderView = [[AppDetailHeaderView alloc] initWithFrame:self.view.frame];
    self.appDetailHeaderView = [[AppDetailHeaderView alloc] init];
    self.view = self.appDetailHeaderView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.appDetailHeaderView.appIconImageView sd_setImageWithURL:[NSURL URLWithString:self.app.iconUrl] placeholderImage:[UIImage systemImageNamed:@"questionmark.circle"]];
    
    self.appDetailHeaderView.appNameLabel.text = self.app.appName;
    self.appDetailHeaderView.appCompanyLabel.text = self.app.company;
    
    self.appHeaderModel = AppHeaderModel.new;
    
    __weak __typeof(self)weakSelf = self;
    self.appHeaderModel.onProgressChanged = ^(double progress) {
        [weakSelf.appDetailHeaderView.progressView setProgress:progress animated:NO];
    };
    self.appHeaderModel.progress = 0;

    self.appHeaderModel.onStateChanged = ^(AppState appState) {
        switch (appState) {
            case readyToGet:
                [weakSelf.appDetailHeaderView.getButton setHidden:NO];
                [weakSelf.appDetailHeaderView.stopButton setHidden:YES];
                [weakSelf.appDetailHeaderView.openButton setHidden:YES];
                break;
            case downloading:
                [weakSelf.appDetailHeaderView.getButton setHidden:YES];
                [weakSelf.appDetailHeaderView.stopButton setHidden:NO];
                [weakSelf.appDetailHeaderView.openButton setHidden:YES];
                break;
            case readyToOpen:
                [weakSelf.appDetailHeaderView.getButton setHidden:YES];
                [weakSelf.appDetailHeaderView.stopButton setHidden:YES];
                [weakSelf.appDetailHeaderView.openButton setHidden:NO];
                break;
        }
    };
    self.appHeaderModel.appState = readyToGet;
    
    [self.appDetailHeaderView.getButton addTarget:self action:@selector(getButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    [self.appDetailHeaderView.stopButton addTarget:self action:@selector(stopButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    [self.appDetailHeaderView.openButton addTarget:self action:@selector(openButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    //UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(performBlock)];
    //[self.view addGestureRecognizer:doubleTapGesture];
    //doubleTapGesture.numberOfTapsRequired = 2;
    //self.appDetailHeaderView.appNameLabel.userInteractionEnabled = YES;
}

- (void)getButtonTapped {
    [self.appHeaderModel get];
}

- (void)stopButtonTapped {
    [self.appHeaderModel stop];
}

- (void)openButtonTapped {
    [self.appHeaderModel open];
}

- (void)performBlock {
    if(block) {
        self.block();
    }
}

@end
