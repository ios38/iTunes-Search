//
//  AppDetailAlbumController.m
//  iTunes Search
//
//  Created by Maksim Romanov on 30.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppDetailAlbumController.h"
#import "AppDetailAlbumView.h"
#import "AppDetailAlbumCell.h"
#import <SDWebImage/SDWebImage.h>

@interface AppDetailAlbumController ()

@property (strong, nonatomic) AppDetailAlbumView *appDetailAlbumView;
@property (strong, nonatomic) ITunesApp *app;

@end

@implementation AppDetailAlbumController

- (instancetype)initWithApp:(ITunesApp *)app {
    self = [super init];
    if (self) {
        self.app = app;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    self.appDetailAlbumView = [[AppDetailAlbumView alloc] init];
    self.view = self.appDetailAlbumView;
    [self.appDetailAlbumView.collectionView registerClass:[AppDetailAlbumCell class] forCellWithReuseIdentifier:@"Cell"];
    self.appDetailAlbumView.collectionView.dataSource = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.app.screenshotUrls count];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    AppDetailAlbumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    [cell configureWithImageUrl:[self.app.screenshotUrls objectAtIndex:indexPath.item]];

    return cell;
}


@end
