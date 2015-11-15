//
//  VKPostTableViewCell+VKPost.h
//  CustomView01
//
//  Created by Nikolay Morev on 15/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "VKPostTableViewCell.h"
#import "VKPost.h"

@interface VKPostTableViewCell (VKPost)

- (void)configureWithPost:(VKPost *)post;

@end
