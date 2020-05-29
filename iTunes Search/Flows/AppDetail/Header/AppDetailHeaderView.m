//
//  AppDetailHeaderView.m
//  iTunes Search
//
//  Created by Maksim Romanov on 28.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppDetailHeaderView.h"

@implementation AppDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureUI];
    }
    return self;
}

- (void)configureUI {
    self.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
    self.appIconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    self.appIconImageView.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
    self.appIconImageView.layer.cornerRadius = 16;
    self.appIconImageView.layer.masksToBounds = YES;
    [self addSubview:self.appIconImageView];
    
    self.appNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 20, self.bounds.size.width - 160, 40)];
    [self addSubview:self.appNameLabel];
    
    self.getAppButton = [[UIButton alloc] initWithFrame:CGRectMake(140, 90, 60, 30)];
    [self.getAppButton setTitle:@"Get" forState:UIControlStateNormal];
    self.getAppButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    self.getAppButton.backgroundColor = [UIColor darkGrayColor];
    self.getAppButton.layer.cornerRadius = 16;
    [self addSubview:self.getAppButton];

}

@end
