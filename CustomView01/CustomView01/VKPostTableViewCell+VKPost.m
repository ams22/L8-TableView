//
//  VKPostTableViewCell+VKPost.m
//  CustomView01
//
//  Created by Nikolay Morev on 15/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "VKPostTableViewCell+VKPost.h"
#import <AFNetworking/UIKit+AFNetworking.h>

@implementation VKPostTableViewCell (VKPost)

- (void)configureWithPost:(VKPost *)post {
    VKPostView *postView = self.postView;
    postView.usernameLabel.text = post.username;
    postView.contentLabel.text = post.text;

    [postView.avatarImageView cancelImageRequestOperation];
    postView.avatarImageView.image = nil;
    [postView.avatarImageView setImageWithURL:post.avatarURL];

//    usleep(300000);
}

@end
