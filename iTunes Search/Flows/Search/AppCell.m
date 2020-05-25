//
//  AppCell.m
//  iTunes Search
//
//  Created by Maksim Romanov on 24.05.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

#import "AppCell.h"
//#import "ImageDownloader.h"
#import <SDWebImage/SDWebImage.h>

@implementation AppCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.appIconImageView = [[UIImageView alloc] init];
        self.appIconImageView.layer.cornerRadius = 7;
        self.appIconImageView.layer.masksToBounds = YES;
        [self addSubview:self.appIconImageView];

        self.appNameLabel = [[UILabel alloc] init];
        //self.appNameLabel.backgroundColor = [UIColor darkGrayColor];
        self.appNameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.appNameLabel];

        self.appRatingLabel = [[UILabel alloc] init];
        //self.appRatingLabel.backgroundColor = [UIColor lightGrayColor];
        self.appRatingLabel.textColor = [UIColor darkGrayColor];
        self.appRatingLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.appRatingLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [self.appIconImageView setFrame:CGRectMake(15, 0, 38, 38)];
    [self.appNameLabel setFrame:CGRectMake(65, 0, self.bounds.size.width - 125, 40)];
    [self.appRatingLabel setFrame:CGRectMake(self.bounds.size.width - 50, 0, 40, 40)];
}

- (void)configureWithApp:(ITunesApp *)app {
    //self.appIconImageView.image = [ImageDownloader imageWithUrl:app.iconUrl];
    [self.appIconImageView sd_setImageWithURL:[NSURL URLWithString:app.iconUrl]
    placeholderImage:[UIImage systemImageNamed:@"questionmark.circle"]];
    self.appNameLabel.text = app.appName;
    self.appRatingLabel.text = [NSString stringWithFormat:@"%.2f", app.averageRating.doubleValue];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
