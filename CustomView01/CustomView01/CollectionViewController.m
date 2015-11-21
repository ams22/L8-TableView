//
//  CollectionViewController.m
//  CustomView01
//
//  Created by Nikolay Morev on 21/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "CollectionViewController.h"
#import "PostsDataSource.h"
#import "AvatarCollectionViewCell.h"
#import <AFNetworking/UIKit+AFNetworking.h>
#import <CHTCollectionViewWaterfallLayout/CHTCollectionViewWaterfallLayout.h>

@interface CollectionViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate,
CHTCollectionViewDelegateWaterfallLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *defaultLayout;
@property (strong, nonatomic) UICollectionViewFlowLayout *anotherFlowLayout;
@property (strong, nonatomic) CHTCollectionViewWaterfallLayout *waterfallLayout;
@property (strong, nonatomic) PostsDataSource *dataSource;
@property (copy, nonatomic) NSArray<VKPost *> *posts;

@end

@implementation CollectionViewController

- (void)awakeFromNib {
    [super awakeFromNib];

    self.dataSource = [[PostsDataSource alloc] init];
    self.posts = [self.dataSource arrayOfRandomVKPostsWithLength:100];

    UICollectionViewFlowLayout *anotherFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    anotherFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    anotherFlowLayout.itemSize = CGSizeMake(300.f, 300.f);
    anotherFlowLayout.sectionInset = UIEdgeInsetsMake(0.f, 0.f, 64.f, 0.f);
    _anotherFlowLayout = anotherFlowLayout;

    CHTCollectionViewWaterfallLayout *waterfallLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
    waterfallLayout.columnCount = 4;
    _waterfallLayout = waterfallLayout;
}

- (UICollectionViewLayout *)layoutWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            return self.defaultLayout;
        case 1:
            return self.anotherFlowLayout;
        case 2:
            return self.waterfallLayout;
        default:
            return nil;
    }
}

- (IBAction)selectLayout:(UISegmentedControl *)segmentedControl {
    UICollectionViewLayout *layout = [self layoutWithIndex:segmentedControl.selectedSegmentIndex];
    [self.collectionView setCollectionViewLayout:layout animated:YES];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AvatarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AvatarCollectionViewCell" forIndexPath:indexPath];
    VKPost *post = self.posts[indexPath.row];

    UIImageView *imageView = cell.imageView;
    [imageView cancelImageRequestOperation];
    imageView.image = nil;
    [imageView setImageWithURL:post.avatarURL];

    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionViewLayout == self.waterfallLayout) {
        return CGSizeMake(100 + arc4random() % 100,
                          100 + arc4random() % 100);
    }
    else if (collectionViewLayout == self.defaultLayout ||
             collectionViewLayout == self.anotherFlowLayout) {
        UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)collectionViewLayout;
        return flowLayout.itemSize;
    }
    else {
        return CGSizeZero;
    }
}

@end
