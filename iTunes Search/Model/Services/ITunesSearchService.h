//
//  ITunesSearchService.h
//  iTunes Search
//
//  Created by Maksim Romanov on 23.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITunesSearchService : NSObject

- (void) getAppsWithQuery:(NSString *) query
                onSuccess:(void(^)(NSArray *iTunesApps)) success
                onFailure:(void(^)(NSError *error)) failure;

@end

NS_ASSUME_NONNULL_END
