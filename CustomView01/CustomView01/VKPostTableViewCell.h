//
//  VKPostTableViewCell.h
//  CustomView01
//
//  Created by Nikolay Morev on 15/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKPostView.h"

@class VKPostTableViewCell;

@protocol VKPostTableViewCellDelegate <NSObject>

@optional

- (void)postTableViewCellDidTapMoreButton:(VKPostTableViewCell *)cell;
- (void)postTableViewCellDidTapCommentButton:(VKPostTableViewCell *)cell;
- (void)postTableViewCellDidTapLikeButton:(VKPostTableViewCell *)cell;

@end

@interface VKPostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet VKPostView *postView;
@property (weak, nonatomic) id<VKPostTableViewCellDelegate> delegate;

@end
