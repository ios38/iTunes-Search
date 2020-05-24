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
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 95, 100, 100)];
    self.imageView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    self.imageView.layer.cornerRadius = 10;
    self.imageView.layer.masksToBounds = YES;
    [self addSubview:self.imageView];
    
    self.imageUrlLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, self.bounds.size.width - 20, 40)];
    [self addSubview:self.imageUrlLabel];
        
}

@end
