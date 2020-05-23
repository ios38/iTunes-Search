//
//  ITunesSearchService.m
//  iTunes Search
//
//  Created by Maksim Romanov on 23.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "ITunesSearchService.h"
#import "AFNetworking.h"
#import "ITunesApp.h"

@interface ITunesSearchService ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@property (strong, nonatomic) NSString *baseUrl;


@end

@implementation ITunesSearchService

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 30;
        self.manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
        //self.manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"text/html", nil];
        
        self.baseUrl = @"https://itunes.apple.com/search";
    }
    return self;
}

- (void) getAppsWithQuery:(NSString *) query
                              onSuccess:(void(^)(NSArray *iTunesApps)) success
                              onFailure:(void(^)(NSError *error)) failure {
    
    NSDictionary* parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"RU",@"country",
                                @"software",@"media",
                                query,@"term",
                                nil];

    [self.manager GET:self.baseUrl parameters:parameters headers:nil progress:nil
      success:^(NSURLSessionDataTask * task, NSDictionary * responseObject) {
        //NSLog(@"%@",responseObject);
        NSMutableArray *iTunesApps = [NSMutableArray new];
        NSArray *array = [responseObject objectForKey:@"results"];
        
        for (NSDictionary *jsonObject in array) {
            ITunesApp *iTunesApp = [[ITunesApp alloc] initWithDictionary:jsonObject];
            [iTunesApps addObject:iTunesApp];
        }
        
        if (success) {
            success(iTunesApps);
        }

    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        NSLog(@"https://opentdb.com/api.php Failure");
        //NSLog(@"error: %@", [error localizedDescription]);
        if (failure) {
            failure(error);
        }
    }];
}

@end
