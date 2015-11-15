//
//  TwitterTableViewCell+TwitterPost.h
//  CustomView01
//
//  Created by Nikolay Morev on 15/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "TwitterTableViewCell.h"
#import "TwitterPost.h"

@interface TwitterTableViewCell (TwitterPost)

- (void)configureWithPost:(TwitterPost *)post;

@end
