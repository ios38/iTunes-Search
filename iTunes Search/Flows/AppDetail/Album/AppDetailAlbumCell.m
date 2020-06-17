//
//  AppDetailAlbumCell.m
//  iTunes Search
//
//  Created by Maksim Romanov on 30.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppDetailAlbumCell.h"
#import "Masonry.h"
#import "ITunesApp.h"
#import <SDWebImage/SDWebImage.h>

@implementation AppDetailAlbumCell

- (void)layoutSubviews {
    //NSLog(@"AppDetailAlbumCell layoutSubviews");
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubviews];
        [self setupConstraints];
        //NSLog(@"AppDetailAlbumCell created");
    }
    return self;
}

- (void)configureSubviews {
    self.imageView = [[UIImageView alloc] init];
    [self addSubview:self.imageView];
    self.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
}

- (void)setupConstraints {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
}

- (void)configureWithImageUrl:(NSString *)imageUrl {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    //[self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage systemImageNamed:@"questionmark.circle"]];
    self.imageUrlLabel.text = imageUrl;
}

@end
