//
//  HackerNewsFeed.h
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Story.h"
#import "FeedParser.h"

extern NSString* const rssUrl;

@interface HackerNewsFeed : NSObject {
@private
    NSMutableArray* stories;
    FPFeed* feed;
}

@property (retain, nonatomic) NSMutableArray* stories;

- (void) loadStories;

@end
