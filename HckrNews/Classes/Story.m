//
//  Story.m
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import "Story.h"

@implementation Story

@synthesize title, description, url, commentsUrl;

- (void) dealloc
{
    [title release];
    [description release];
    [url release];
    [commentsUrl release];
    [super dealloc];
}

- (NSComparisonResult)compare:(Story *)otherStory {
    return [otherStory.description compare:description];
}

@end
