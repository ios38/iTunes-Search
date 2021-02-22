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
//#define MAS_SHORTHAND
#import "Masonry.h"

@interface AppDetailHeaderController ()

@property (strong, nonatomic) AppDetailHeaderView *appDetailHeaderView;
@property (strong, nonatomic) ITunesApp *app;

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

    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(performBlock)];
    [self.view addGestureRecognizer:doubleTapGesture];
    doubleTapGesture.numberOfTapsRequired = 2;
    //self.appDetailHeaderView.appNameLabel.userInteractionEnabled = YES;
    
    [self.appDetailHeaderView.getAppButton addTarget:self action:@selector(performBlock) forControlEvents:UIControlEventTouchUpInside];
}

- (void)performBlock {
    if(block) {
        self.block();
    }
}

@end
