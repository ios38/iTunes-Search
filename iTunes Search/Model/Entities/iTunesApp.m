//
//  iTunesApp.m
//  iTunes Search
//
//  Created by Maksim Romanov on 23.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "ITunesApp.h"

@implementation ITunesApp

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.appName = [dictionary valueForKey:@"trackName"];
        self.appUrl = [dictionary valueForKey:@"artistViewUrl"];
        self.company = [dictionary valueForKey:@"sellerName"];
        self.companyUrl = [dictionary valueForKey:@"sellerUrl"];
        self.appDescription = [dictionary valueForKey:@"description"];
        self.averageRating = [dictionary valueForKey:@"averageUserRating"];
        self.averageRatingForCurrentVersion = [dictionary valueForKey:@"averageUserRatingForCurrentVersion"];
        self.size = [dictionary valueForKey:@"fileSizeBytes"];
        self.iconUrl = [dictionary valueForKey:@"artworkUrl512"];
        self.screenshotUrls = [dictionary valueForKey:@"screenshotUrls"];
    }
    return self;
}

@end
