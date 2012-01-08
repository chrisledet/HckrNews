//
//  HackerNewsFeed.m
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import "HackerNewsFeed.h"

NSString* const rssUrl = @"http://news.ycombinator.com/rss";

@implementation HackerNewsFeed

@synthesize stories;

- (void) dealloc
{
    [stories release];
    [super dealloc];
}

- (void) sortStories:(NSMutableArray *) s
{
    [s sortUsingSelector:@selector(compare:)];
}

- (void) loadStories
{
    NSURL* feedURL = [[NSURL alloc] initWithString:rssUrl];
    NSData* feedData = [[NSData alloc] initWithContentsOfURL:feedURL];
    
    feed = [FPParser parsedFeedWithData:feedData error:nil];
    stories = [[NSMutableArray alloc] init];
    
    for (FPItem* item in feed.items) {
        Story* story = [[Story alloc] init];
        
        story.title         = item.title;
        story.url           = [NSURL URLWithString:item.link.href];
        story.commentsUrl   = [NSURL URLWithString:item.content];
        story.description   = item.content;

        [stories addObject:story];
    }
    
//    [feed release];
    [feedData release];
    [feedURL release];
    
    [self sortStories:stories];
}

- (id) init
{    
    self = [super init];
    
    if (self) {
        [self loadStories];
    }
    
    return self;
}

@end
