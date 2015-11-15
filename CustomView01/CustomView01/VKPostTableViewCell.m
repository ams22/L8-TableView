//
//  VKPostTableViewCell.m
//  CustomView01
//
//  Created by Nikolay Morev on 15/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "VKPostTableViewCell.h"

@implementation VKPostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.selectionStyle = UITableViewCellSelectionStyleNone;

    VKPostView *postView = [VKPostView loadFromNib];
    postView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:postView];
    _postView = postView;

    [self.contentView.topAnchor constraintEqualToAnchor:postView.topAnchor].active = YES;
    [self.contentView.layoutMarginsGuide.bottomAnchor constraintEqualToAnchor:postView.bottomAnchor].active = YES;
    [self.contentView.readableContentGuide.leadingAnchor constraintEqualToAnchor:postView.leadingAnchor].active = YES;
    [self.contentView.readableContentGuide.trailingAnchor constraintEqualToAnchor:postView.trailingAnchor].active = YES;

    [postView.moreButton addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    [postView.commentButton addTarget:self action:@selector(comment) forControlEvents:UIControlEventTouchUpInside];
    [postView.likeButton addTarget:self action:@selector(like) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    self.postView.backgroundColor = (highlighted
                                     ? [UIColor colorWithRed:0.45 green:0.981 blue:0.474 alpha:1]
                                     : [UIColor colorWithRed:0.832 green:0.985 blue:0.473 alpha:1]);
}

- (void)more {
    id<VKPostTableViewCellDelegate> delegate = self.delegate;
    if ([delegate respondsToSelector:@selector(postTableViewCellDidTapMoreButton:)]) {
        [delegate postTableViewCellDidTapMoreButton:self];
    }
}

- (void)comment {
    id<VKPostTableViewCellDelegate> delegate = self.delegate;
    if ([delegate respondsToSelector:@selector(postTableViewCellDidTapCommentButton:)]) {
        [delegate postTableViewCellDidTapCommentButton:self];
    }
}

- (void)like {
    id<VKPostTableViewCellDelegate> delegate = self.delegate;
    if ([delegate respondsToSelector:@selector(postTableViewCellDidTapLikeButton:)]) {
        [delegate postTableViewCellDidTapLikeButton:self];
    }
}

@end
