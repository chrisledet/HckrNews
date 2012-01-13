//
//  Story.m
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import "Story.h"

@implementation Story

@synthesize title, url, commentsUrl;

- (void) dealloc
{
    [title release];
    [url release];
    [commentsUrl release];
    [super dealloc];
}

- (NSComparisonResult)compare:(Story *)otherStory {
    return [[otherStory commentsUrlAsString] compare:[self commentsUrlAsString]];
}

- (NSString*) commentsUrlAsString
{
    return commentsUrl.absoluteString;
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"Title: %@, URL: %@", title, [self commentsUrlAsString]];
}

@end
