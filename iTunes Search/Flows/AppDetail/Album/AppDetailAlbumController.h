//
//  AppDetailAlbumController.h
//  iTunes Search
//
//  Created by Maksim Romanov on 30.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITunesApp.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDetailAlbumController : UIViewController <UICollectionViewDataSource>

- (instancetype)initWithApp:(ITunesApp *)app;

@end

NS_ASSUME_NONNULL_END
