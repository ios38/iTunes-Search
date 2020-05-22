//
//  AppStartManager.h
//  iTunes Search
//
//  Created by Maksim Romanov on 22.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppStartManager : NSObject

@property (strong, nonatomic) UIWindow * window;

- (instancetype)initWithWindow:(UIWindow *)window;
- (void)start;

@end

NS_ASSUME_NONNULL_END
