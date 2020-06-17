//
//  AppHeaderModel.m
//  iTunes Search
//
//  Created by Maksim Romanov on 17.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppHeaderModel.h"

@interface AppHeaderModel ()

@property (strong,nonatomic) NSTimer *timer;

@end


@implementation AppHeaderModel

@synthesize onStateChanged;
@synthesize onProgressChanged;


- (void)setAppState:(AppState)appState {
    _appState = appState;
    self.onStateChanged(appState);
}

- (void)setProgress:(double)progress {
    _progress = progress;
    self.onProgressChanged(progress);
}

- (void)get {
    //NSLog(@"User pressed Get");
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 repeats:YES block:^(NSTimer * _Nonnull timer) {
        double newProgress = self.progress + 0.02;
        
        if (newProgress > 1) {
            [self.timer invalidate];
            self.appState = readyToOpen;
            newProgress = 0;
        }
        
        self.progress = MIN(newProgress, 1);
    }];
    self.appState = downloading;
}

- (void)stop {
    //NSLog(@"User pressed Stop");
    [self.timer invalidate];
    self.progress = 0;
    self.appState = readyToGet;
}

- (void)open {
    NSLog(@"User pressed Open");
}

@end
