//
//  AppDetailHeaderController.h
//  iTunes Search
//
//  Created by Maksim Romanov on 28.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITunesApp.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AppDetailHeaderOutput <NSObject>

@property void(^_Nullable block)(void);

@end

@interface AppDetailHeaderController : UIViewController <AppDetailHeaderOutput>

- (instancetype)initWithApp:(ITunesApp *)app andBlock:(void(^_Nullable)(void))block;

@end

NS_ASSUME_NONNULL_END
