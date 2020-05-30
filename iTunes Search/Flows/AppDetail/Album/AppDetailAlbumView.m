//
//  AppDetailAlbumView.m
//  iTunes Search
//
//  Created by Maksim Romanov on 30.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppDetailAlbumView.h"
#import "Masonry.h"

@implementation AppDetailAlbumView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configureSubviews];
        [self setupConstraints];
    }
    return self;
}

- (void)configureSubviews {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(150, 270);
    flowLayout.minimumLineSpacing = 3.0;
    flowLayout.minimumInteritemSpacing = 3.0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.collectionView];
}

- (void)setupConstraints {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

@end
