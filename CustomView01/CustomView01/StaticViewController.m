//
//  StaticViewController.m
//  CustomView01
//
//  Created by Nikolay Morev on 15/11/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "StaticViewController.h"
@import SafariServices;

@implementation StaticViewController

- (IBAction)home:(id)sender {
    [self openURL:[NSURL URLWithString:@"http://www.piedpiper.com/"]];
}

- (IBAction)technology:(id)sender {
    [self openURL:[NSURL URLWithString:@"http://www.piedpiper.com/#technology-section"]];
}

- (IBAction)whoWeAre:(id)sender {
    [self openURL:[NSURL URLWithString:@"http://www.piedpiper.com/#who-we-are-section"]];
}

- (IBAction)blog:(id)sender {
    [self openURL:[NSURL URLWithString:@"http://www.piedpiper.com/blog/"]];
}

- (void)openURL:(NSURL *)URL {
    SFSafariViewController *controller = [[SFSafariViewController alloc] initWithURL:URL];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
