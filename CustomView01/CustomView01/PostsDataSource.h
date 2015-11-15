//
//  VKPostDataSource.h
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKPost.h"
#import "TwitterPost.h"

@interface PostsDataSource : NSObject

- (VKPost *)randomVKPost;
- (NSArray<VKPost *> *)arrayOfRandomVKPostsWithLength:(NSUInteger)length;
- (NSArray<id<Post>> *)arrayOfRandomPostsWithLength:(NSUInteger)length;


@end
