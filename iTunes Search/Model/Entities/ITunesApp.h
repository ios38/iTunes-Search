//
//  iTunesApp.h
//  iTunes Search
//
//  Created by Maksim Romanov on 23.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITunesApp : NSObject

@property (strong,nonatomic) NSString *appName;
@property (strong,nonatomic,nullable) NSString *appUrl;
@property (strong,nonatomic,nullable) NSString *company;
@property (strong,nonatomic,nullable) NSString *companyUrl;
@property (strong,nonatomic,nullable) NSString *appDescription;
@property (strong,nonatomic,nullable) NSNumber *averageRating;
@property (strong,nonatomic,nullable) NSNumber *averageRatingForCurrentVersion;
@property (strong,nonatomic,nullable) NSNumber *size;
@property (strong,nonatomic,nullable) NSString *iconUrl;
@property (strong,nonatomic,nullable) NSArray *screenshotUrls;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
