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
    
    self.getButton = [[UIButton alloc] init];
    self.getButton.imageView.tintColor = [UIColor systemBlueColor];
    [self.getButton setImage:[UIImage systemImageNamed:@"icloud.and.arrow.down"] forState:UIControlStateNormal];
    self.getButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //[self.getButton setTitle:@"Get" forState:UIControlStateNormal];
    //self.getButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    //self.getButton.backgroundColor = [UIColor systemBlueColor];
    //self.getButton.layer.cornerRadius = 16;
    [self addSubview:self.getButton];
    [self.getButton setHidden:NO];

    self.stopButton = [[UIButton alloc] init];
    self.stopButton.imageView.tintColor = [UIColor systemBlueColor];
    [self.stopButton setImage:[UIImage systemImageNamed:@"stop.circle"] forState:UIControlStateNormal];
    self.stopButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //[self.stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    //self.stopButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    //self.stopButton.backgroundColor = [UIColor systemBlueColor];
    //self.stopButton.layer.cornerRadius = 16;
    [self addSubview:self.stopButton];
    [self.stopButton setHidden:YES];

    self.openButton = [[UIButton alloc] init];
    [self.openButton setTitle:@"Open" forState:UIControlStateNormal];
    self.openButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    self.openButton.backgroundColor = [UIColor systemBlueColor];
    self.openButton.layer.cornerRadius = 16;
    [self addSubview:self.openButton];
    [self.openButton setHidden:YES];
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
        make.top.equalTo(self.appNameLabel.mas_bottom).with.offset(7);
        //make.top.equalTo(self.mas_top).with.offset(30);
        make.left.equalTo(self.appIconImageView.mas_right).with.offset(20);
        make.right.equalTo(self.mas_right);
    }];
    [self.progressView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.appCompanyLabel.bottom).with.offset(10);
        make.left.equalTo(self.appIconImageView.right).with.offset(20);
        make.right.equalTo(self.right).with.inset(20);
    }];
    [self.getButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.appIconImageView.right).with.offset(20);
        make.bottom.equalTo(self.appIconImageView.bottom);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(30);
    }];
    [self.getButton.imageView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.getButton);
    }];
    [self.stopButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.appIconImageView.right).with.offset(20);
        make.bottom.equalTo(self.appIconImageView.bottom);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(30);
    }];
    [self.stopButton.imageView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.stopButton);
    }];
    [self.openButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.appIconImageView.right).with.offset(20);
        make.bottom.equalTo(self.appIconImageView.bottom);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
}

@end
