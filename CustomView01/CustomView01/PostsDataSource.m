//
//  VKPostDataSource.m
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "PostsDataSource.h"

@interface PostsDataSource ()

@property (nonatomic, copy) NSArray *usernames;
@property (nonatomic, copy) NSArray *avatarNames;
@property (nonatomic, copy) NSString *hipsumText;

@end

@implementation PostsDataSource

- (instancetype)init {
    if (self = [super init]) {
        _usernames = @[ @"Ксения Федотова",
                        @"Аврора Дьячкова",
                        @"Руслана Авдеева",
                        @"Катерина Медведева",
                        @"Астра Суворова",
                        @"Полина Мясникова",
                        @"Магдалина Емельянова",
                        @"Викторина Юдина",
                        @"Сюзанна Гаскарова" ];
        _avatarNames = @[ @"avatar",
                          @"avatar1",
                          @"avatar2",
                          @"avatar3",
                          @"avatar4",
                          @"avatar5",
                          @"avatar6",
                          @"avatar7" ];
        _hipsumText = @"Farm-to-table blog distillery offal, echo park lomo williamsburg. Crucifix organic quinoa, kitsch vinyl artisan dreamcatcher hashtag salvia everyday carry viral forage tumblr raw denim chambray. Banh mi tilde VHS, retro disrupt pug wolf kombucha lumbersexual meggings chia. Meh mustache sriracha franzen, flexitarian cold-pressed biodiesel ugh raw denim waistcoat green juice neutra. Hoodie celiac tofu lumbersexual meditation pop-up franzen, typewriter seitan wayfarers food truck. Normcore pinterest disrupt, fingerstache heirloom pop-up shabby chic food truck four loko meggings. Hella butcher keffiyeh keytar.";
    }
    return self;
}

- (VKPost *)randomVKPost {
    NSString *username = self.usernames[arc4random() % self.usernames.count];
    UIImage *avatar = [UIImage imageNamed:self.avatarNames[arc4random() % self.avatarNames.count]];
    NSString *text = [self.hipsumText substringToIndex:arc4random() % self.hipsumText.length];

    NSInteger avatarIndex = arc4random() % 10;
    NSURL *avatarURL = [NSURL URLWithString:
                        [NSString stringWithFormat:@"http://lorempixel.com/200/200/cats/%li/", (long)avatarIndex]];

    return [[VKPost alloc] initWithUsername:username avatar:avatar avatarURL:avatarURL text:text];
}

- (TwitterPost *)randomTwitterPost {
    NSString *text = [self.hipsumText substringToIndex:arc4random() % MIN(140, self.hipsumText.length)];
    return [[TwitterPost alloc] initWithText:text];
}

- (NSArray<VKPost *> *)arrayOfRandomVKPostsWithLength:(NSUInteger)length {
    NSMutableArray *posts = [NSMutableArray array];
    for (NSUInteger i = 0; i < length; i++) {
        [posts addObject:[self randomVKPost]];
    }
    return posts;
}

- (NSArray<id<Post>> *)arrayOfRandomPostsWithLength:(NSUInteger)length {
    NSMutableArray *posts = [NSMutableArray array];
    for (NSUInteger i = 0; i < length; i++) {
        id<Post> post = (arc4random() % 100 < 80
                         ? [self randomVKPost]
                         : [self randomTwitterPost]);
        [posts addObject:post];
    }
    return posts;
}

@end
