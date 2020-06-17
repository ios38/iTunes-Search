//
//  AppDetailHeaderView.h
//  iTunes Search
//
//  Created by Maksim Romanov on 28.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDetailHeaderView : UIView

@property (strong, nonatomic) UIImageView *appIconImageView;
@property (strong, nonatomic) UILabel *appNameLabel;
@property (strong, nonatomic) UILabel *appCompanyLabel;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) UIButton *getAppButton;
@property (strong, nonatomic) UIButton *stopAppButton;
@property (strong, nonatomic) UIButton *openAppButton;

@end

NS_ASSUME_NONNULL_END
