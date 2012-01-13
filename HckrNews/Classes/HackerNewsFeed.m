//
//  HackerNewsFeed.m
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import "HackerNewsFeed.h"

NSString* const rssUrl = @"http://news.ycombinator.com/rss";

@interface HackerNewsFeed()
- (void) sortStories:(NSMutableArray *) s;
- (NSURL*) parseURLFromString:(NSString*)commentUrlString;
@end

@implementation HackerNewsFeed

@synthesize stories;

- (void) dealloc
{
    [stories release];
    [super dealloc];
}

- (id) init
{
    self = [super init];

    if (self) {
        [self loadStories];
    }

    return self;
}

- (void) loadStories
{
    NSURL* feedURL = [[NSURL alloc] initWithString:rssUrl];
    NSData* feedData = [[NSData alloc] initWithContentsOfURL:feedURL];
    
    feed = [FPParser parsedFeedWithData:feedData error:nil];
    if (stories) {
        [stories release];
    }
    stories = [[NSMutableArray alloc] init];
    
    for (FPItem* item in feed.items) {
        Story* story = [[Story alloc] init];
        story.title = item.title;
        story.url = [NSURL URLWithString:item.link.href];
        story.commentsUrl = [self parseURLFromString:item.description];
        
        [stories addObject:story];
        [story release];
    }

    [feedData release];
    [feedURL release];

    [self sortStories:stories];
}

- (void) sortStories:(NSMutableArray *) s
{
    [s sortUsingSelector:@selector(compare:)];
}

- (NSURL*) parseURLFromString:(NSString*)commentUrlString
{
    NSRange startOfHref = [commentUrlString rangeOfString:@"=\""];
    NSInteger lengthCutOff = [commentUrlString length] - 23;
    NSString* stringURL = [commentUrlString substringWithRange:NSMakeRange(startOfHref.location + 2, lengthCutOff)];
    return [NSURL URLWithString:stringURL];
}

@end
