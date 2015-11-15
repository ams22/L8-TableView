//
//  VKPostView+VKPost.m
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "VKPostView+VKPost.h"

@implementation VKPostView (VKPost)

- (void)configureWithPost:(VKPost *)post {
    self.avatarImageView.image = post.avatar;
    self.usernameLabel.text = post.username;
    self.contentLabel.text = post.text;
}

@end
