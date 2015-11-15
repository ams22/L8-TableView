//
//  VKNiblessPostView.m
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "VKNiblessPostView.h"

@interface VKNiblessPostView ()

@end

@implementation VKNiblessPostView

- (void)setup {
    // Добавляем subview

    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:avatarImageView];
    _avatarImageView = avatarImageView;

    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:usernameLabel];
    _usernameLabel = usernameLabel;

    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:moreButton];
    _moreButton = moreButton;

    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:contentLabel];
    _contentLabel = contentLabel;

    UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:commentButton];
    _commentButton = commentButton;

    UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:likeButton];
    _likeButton = likeButton;

    // Задаем свойства

    self.backgroundColor = [UIColor colorWithRed:0.832 green:0.985 blue:0.473 alpha:1];
    self.layer.cornerRadius = 4.f;

    avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    avatarImageView.layer.cornerRadius = 21.f;
    avatarImageView.layer.masksToBounds = YES;
    avatarImageView.layer.borderWidth = 1.f;
    avatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;

    [commentButton setImage:[UIImage imageNamed:@"comment-icon"] forState:UIControlStateNormal];
    commentButton.contentEdgeInsets = UIEdgeInsetsMake(2.f, 2.f, 2.f, 2.f);
    commentButton.contentMode = UIViewContentModeScaleAspectFit;
    commentButton.backgroundColor = [UIColor colorWithRed:0.837 green:0.837 blue:0.837 alpha:1];
    commentButton.layer.cornerRadius = 3.f;

    [likeButton setImage:[UIImage imageNamed:@"heart-icon"] forState:UIControlStateNormal];
    likeButton.contentEdgeInsets = UIEdgeInsetsMake(2.f, 2.f, 2.f, 2.f);
    likeButton.contentMode = UIViewContentModeScaleAspectFit;
    likeButton.backgroundColor = [UIColor colorWithRed:0.837 green:0.837 blue:0.837 alpha:1];
    likeButton.layer.cornerRadius = 3.f;

    [moreButton setImage:[UIImage imageNamed:@"more-icon"] forState:UIControlStateNormal];
    moreButton.contentEdgeInsets = UIEdgeInsetsMake(2.f, 2.f, 2.f, 2.f);
    moreButton.contentMode = UIViewContentModeScaleAspectFit;

    usernameLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];

    contentLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    contentLabel.numberOfLines = 0;

    // Layout

    avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
    commentButton.translatesAutoresizingMaskIntoConstraints = NO;
    likeButton.translatesAutoresizingMaskIntoConstraints = NO;
    moreButton.translatesAutoresizingMaskIntoConstraints = NO;
    contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    usernameLabel.translatesAutoresizingMaskIntoConstraints = NO;

    [avatarImageView.widthAnchor constraintEqualToConstant:42.f].active = YES;
    [avatarImageView.heightAnchor constraintEqualToConstant:42.f].active = YES;
    [commentButton.widthAnchor constraintEqualToConstant:26.f].active = YES;
    [commentButton.heightAnchor constraintEqualToConstant:26.f].active = YES;
    [likeButton.widthAnchor constraintEqualToConstant:26.f].active = YES;
    [likeButton.heightAnchor constraintEqualToConstant:26.f].active = YES;
    [moreButton.widthAnchor constraintEqualToConstant:26.f].active = YES;
    [moreButton.heightAnchor constraintEqualToConstant:26.f].active = YES;

    [avatarImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:4.f].active = YES;
    [avatarImageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:4.f].active = YES;
    [self.trailingAnchor constraintGreaterThanOrEqualToAnchor:contentLabel.trailingAnchor constant:4.f].active = YES;
    [contentLabel.topAnchor constraintEqualToAnchor:avatarImageView.bottomAnchor constant:4.f].active = YES;
    [contentLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:4.f].active = YES;
    [usernameLabel.topAnchor constraintEqualToAnchor:avatarImageView.topAnchor constant:4.f].active = YES;
    [usernameLabel.leadingAnchor constraintEqualToAnchor:avatarImageView.trailingAnchor constant:4.f].active = YES;
    [commentButton.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:4.f].active = YES;
    [commentButton.topAnchor constraintGreaterThanOrEqualToAnchor:contentLabel.bottomAnchor constant:4.f].active = YES;
    ({
        NSLayoutConstraint *c = [commentButton.topAnchor constraintEqualToAnchor:contentLabel.bottomAnchor constant:4.f];
        c.priority = 249;
        c;
    }).active = YES;
    [self.bottomAnchor constraintEqualToAnchor:commentButton.bottomAnchor constant:4.f].active = YES;
    [moreButton.leadingAnchor constraintGreaterThanOrEqualToAnchor:usernameLabel.trailingAnchor constant:4.f].active = YES;
    [self.trailingAnchor constraintEqualToAnchor:moreButton.trailingAnchor constant:4.f].active = YES;
    [moreButton.topAnchor constraintEqualToAnchor:self.topAnchor constant:4.f].active = YES;
    [self.bottomAnchor constraintEqualToAnchor:likeButton.bottomAnchor constant:4.f].active = YES;
    [self.trailingAnchor constraintEqualToAnchor:likeButton.trailingAnchor constant:4.f].active = YES;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

@end
