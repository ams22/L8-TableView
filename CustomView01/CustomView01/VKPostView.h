//
//  VKPostView.h
//  CustomView01
//
//  Created by Nikolay Morev on 07/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKPostView : UIView

+ (instancetype)loadFromNib;

@property (nonatomic, weak) IBOutlet UIButton *moreButton;
@property (nonatomic, weak) IBOutlet UIButton *commentButton;
@property (nonatomic, weak) IBOutlet UIButton *likeButton;
@property (nonatomic, weak) IBOutlet UIImageView *avatarImageView;
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UILabel *contentLabel;

@property (nonatomic, copy) NSString *contentText;

@end
