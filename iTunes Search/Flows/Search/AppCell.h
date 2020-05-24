//
//  AppCell.h
//  iTunes Search
//
//  Created by Maksim Romanov on 24.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITunesApp.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppCell : UITableViewCell

@property (strong, nonatomic) UIImageView *appIconImageView;
@property (strong, nonatomic) UILabel *appNameLabel;
@property (strong, nonatomic) UILabel *appRatingLabel;

- (void)configureWithApp:(ITunesApp *)app;

@end

NS_ASSUME_NONNULL_END
