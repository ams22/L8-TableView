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
