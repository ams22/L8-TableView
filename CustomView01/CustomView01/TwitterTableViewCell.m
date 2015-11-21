//
//  TwitterTableViewCell.m
//  CustomView01
//
//  Created by Nikolay Morev on 15/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "TwitterTableViewCell.h"

@implementation TwitterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.patternView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"symphony"]];
    self.patternView.layer.cornerRadius = 4.f;
}

@end
