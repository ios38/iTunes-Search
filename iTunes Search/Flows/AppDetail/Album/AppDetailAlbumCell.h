//
//  AppDetailAlbumCell.h
//  iTunes Search
//
//  Created by Maksim Romanov on 30.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDetailAlbumCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *imageUrlLabel;

- (void)configureWithImageUrl:(NSString *)imageUrl;

@end

NS_ASSUME_NONNULL_END
