//
//  FeedViewController.m
//  CustomView01
//
//  Created by Nikolay Morev on 15/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "FeedViewController.h"
#import "PostsDataSource.h"
#import "VKPostTableViewCell.h"
#import "VKPostTableViewCell+VKPost.h"
#import "TwitterTableViewCell.h"
#import "TwitterTableViewCell+TwitterPost.h"

@interface FeedViewController () <UITableViewDataSource, UITableViewDelegate, VKPostTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<id<Post>> *posts;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = self.tableView;
    tableView.estimatedRowHeight = 200.f;
    tableView.rowHeight = UITableViewAutomaticDimension;

    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [tableView addSubview:refreshControl];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    UIEdgeInsets insets = UIEdgeInsetsMake(self.topLayoutGuide.length, 0,
                                           self.bottomLayoutGuide.length, 0);

    UITableView *tableView = self.tableView;
    tableView.contentInset = insets;
    tableView.scrollIndicatorInsets = insets;
    if (tableView.contentOffset.y <= 0.f) {
        tableView.contentOffset = CGPointMake(tableView.contentOffset.x, -insets.top);
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    id<Post> post = self.posts[indexPath.row];
    
    if ([post isKindOfClass:[VKPost class]]) {
        VKPostTableViewCell *VKcell = [tableView dequeueReusableCellWithIdentifier:@"VKPostTableViewCell" forIndexPath:indexPath];
        VKcell.delegate = self;
        VKPost *VKpost = post;
        [VKcell configureWithPost:VKpost];
        cell = VKcell;
    }
    else if ([post isKindOfClass:[TwitterPost class]]) {
        TwitterTableViewCell *twitterCell = [tableView dequeueReusableCellWithIdentifier:@"TwitterTableViewCell" forIndexPath:indexPath];
        TwitterPost *twitterPost = post;
        [twitterCell configureWithPost:twitterPost];
        cell = twitterCell;
    }

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [self.posts removeObjectAtIndex:indexPath.row];

    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
}

#pragma mark - VKPostTableViewCellDelegate

- (void)postTableViewCellDidTapMoreButton:(VKPostTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    VKPost *post = self.posts[indexPath.row];
    [self alertWithMessage:[NSString stringWithFormat:@"more\n %li %@", (long)indexPath.row, post.username]];
}

- (void)postTableViewCellDidTapCommentButton:(VKPostTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    VKPost *post = self.posts[indexPath.row];
    [self alertWithMessage:[NSString stringWithFormat:@"comment\n %li %@", (long)indexPath.row, post.username]];
}

- (void)postTableViewCellDidTapLikeButton:(VKPostTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    VKPost *post = self.posts[indexPath.row];
    [self alertWithMessage:[NSString stringWithFormat:@"like\n %li %@", (long)indexPath.row, post.username]];
}

- (void)alertWithMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    // Эмулируем сетевую задержку
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self reloadData];
        [refreshControl endRefreshing];
    });
}

- (void)reloadData {
    PostsDataSource *postDataSource = [[PostsDataSource alloc] init];
    self.posts = [[postDataSource arrayOfRandomPostsWithLength:20] mutableCopy];
    [self.tableView reloadData];
}

@end
