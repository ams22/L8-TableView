//
//  TwitterTableViewCell+TwitterPost.m
//  CustomView01
//
//  Created by Nikolay Morev on 15/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "TwitterTableViewCell+TwitterPost.h"

@implementation TwitterTableViewCell (TwitterPost)

- (void)configureWithPost:(TwitterPost *)post {
    self.tweetLabel.text = post.text;
}

@end
