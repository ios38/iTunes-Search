//
//  AppDetailView.m
//  iTunes Search
//
//  Created by Maksim Romanov on 23.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppDetailView.h"

@implementation AppDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureUI];
    }
    return self;
}

- (void)configureUI {
    
    self.appIconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 110, 100, 100)];
    self.appIconImageView.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
    self.appIconImageView.layer.cornerRadius = 10;
    self.appIconImageView.layer.masksToBounds = YES;
    [self addSubview:self.appIconImageView];
    
    self.appNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 110, self.bounds.size.width - 160, 40)];
    [self addSubview:self.appNameLabel];
        
}

@end
