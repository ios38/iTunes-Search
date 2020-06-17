//
//  AppHeaderModel.h
//  iTunes Search
//
//  Created by Maksim Romanov on 17.06.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    readyToGet,
    downloading,
    readyToOpen
} AppState;

@protocol AppHeaderModelInput <NSObject>

- (void) stop;
- (void) get;
- (void) open;

@end

@protocol AppHeaderModelOutput <NSObject>

@property (assign,nonatomic) AppState appState;
@property (assign,nonatomic) double progress;
@property (copy, nonatomic) void (^onStateChanged)(AppState);
@property (copy, nonatomic) void (^onProgressChanged)(double);

@end

@interface AppHeaderModel : NSObject <AppHeaderModelInput, AppHeaderModelOutput>

@property (assign,nonatomic) AppState appState;
@property (assign,nonatomic) double progress;

@end

NS_ASSUME_NONNULL_END
