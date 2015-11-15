//
//  VKPostView.m
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "VKPostView.h"

@implementation VKPostView

+ (instancetype)loadFromNib {
    return [[[NSBundle bundleForClass:[self class]]
             loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]
            firstObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.commentButton.layer.cornerRadius = 3.f;
    self.likeButton.layer.cornerRadius = 3.f;
    self.avatarImageView.layer.cornerRadius = 21.f;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.borderWidth = 1.f;
    self.avatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.cornerRadius = 4.f;
}

@end
