//
//  AppDetailHeaderView.m
//  iTunes Search
//
//  Created by Maksim Romanov on 28.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppDetailHeaderView.h"
#define MAS_SHORTHAND
#import "Masonry.h"

@implementation AppDetailHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configureSubviews];
        [self setupConstraints];
    }
    return self;
}

- (void)configureSubviews {
    self.appIconImageView = [[UIImageView alloc] init];
    //self.appIconImageView.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
    self.appIconImageView.layer.cornerRadius = 16;
    self.appIconImageView.layer.masksToBounds = YES;
    [self addSubview:self.appIconImageView];
    
    self.appNameLabel = [[UILabel alloc] init];
    //self.appNameLabel.backgroundColor = [UIColor darkGrayColor];
    self.appNameLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    [self addSubview:self.appNameLabel];
    
    self.appCompanyLabel = [[UILabel alloc] init];
    self.appCompanyLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    self.appCompanyLabel.textColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self addSubview:self.appCompanyLabel];

    self.progressView = UIProgressView.new;
    [self addSubview:self.progressView];
    
    self.getAppButton = [[UIButton alloc] init];
    [self.getAppButton setTitle:@"Get" forState:UIControlStateNormal];
    self.getAppButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    self.getAppButton.backgroundColor = [UIColor darkGrayColor];
    self.getAppButton.layer.cornerRadius = 16;
    [self addSubview:self.getAppButton];
}

- (void)setupConstraints {
    [self.appIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.height.mas_equalTo(100);
    }];
    [self.appNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.appIconImageView.mas_right).with.offset(20);
        make.right.equalTo(self.mas_right);
    }];
    [self.appCompanyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.appNameLabel.mas_bottom).with.offset(10);
        //make.top.equalTo(self.mas_top).with.offset(30);
        make.left.equalTo(self.appIconImageView.mas_right).with.offset(20);
        make.right.equalTo(self.mas_right);
    }];
    [self.progressView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.appCompanyLabel.bottom).with.offset(10);
        make.left.equalTo(self.appIconImageView.right).with.offset(20);
        make.right.equalTo(self.right).with.inset(20);
    }];
    [self.getAppButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.appIconImageView.mas_right).with.offset(20);
        make.bottom.equalTo(self.appIconImageView.mas_bottom);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
}

@end
