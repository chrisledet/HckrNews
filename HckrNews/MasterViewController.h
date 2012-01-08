//
//  MasterViewController.h
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HackerNewsFeed.h"
#import "PullRefreshTableViewController.h"

@class DetailViewController;

@interface MasterViewController : PullRefreshTableViewController {
    HackerNewsFeed* feed;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
