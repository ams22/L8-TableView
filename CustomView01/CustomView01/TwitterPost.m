//
//  TwitterPost.m
//  CustomView01
//
//  Created by Nikolay Morev on 15/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "TwitterPost.h"

@implementation TwitterPost

- (instancetype)initWithText:(NSString *)text {
    if (self = [super init]) {
        _text = [text copy];
    }
    return self;
}

@end
