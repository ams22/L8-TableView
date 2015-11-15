//
//  VKPost.h
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface VKPost : NSObject <Post>

- (instancetype)initWithUsername:(NSString *)username
                          avatar:(nullable UIImage *)avatar
                       avatarURL:(nullable NSURL *)avatarURL
                            text:(NSString *)text NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@property (nonatomic, readonly, copy) NSString *username;
@property (nonatomic, readonly, strong, nullable) UIImage *avatar;
@property (nonatomic, readonly, copy, nullable) NSURL *avatarURL;
@property (nonatomic, readonly, copy) NSString *text;

@end

NS_ASSUME_NONNULL_END
