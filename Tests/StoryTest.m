//
//  StoryTest.m
//  HckrNews
//
//  Created by Chris Ledet on 1/12/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "Story.h"

@interface StoryTest : GHTestCase { }
@end

@implementation StoryTest

- (void) testcommentsUrlAsString
{
    Story* story = [[Story alloc] init];
    NSString* urlString = @"http://google.com";
    NSURL* url = [NSURL URLWithString:urlString];
    story.commentsUrl = url;
    GHAssertEqualObjects(urlString, [story commentsUrlAsString], @"urlString should equal %@", urlString);
    [story release];
}

- (void) testSortByDescendingCommentsURL
{
    Story* story1 = [[Story alloc] init];
    story1.commentsUrl = [NSURL URLWithString:@"http://hckernews.com?id=123"];
    
    Story* story2 = [[Story alloc] init];
    story2.commentsUrl = [NSURL URLWithString:@"http://hckernews.com?id=456"];
    
    NSMutableArray* stories = [[NSMutableArray alloc] initWithObjects:story1, story2, nil];
    [stories sortUsingSelector:@selector(compare:)];
    
    GHAssertEqualObjects(story2, [stories objectAtIndex:0], @"Story with latest url should be first.");
    GHAssertEqualObjects(story1, [stories objectAtIndex:1], @"Story with oldest url should be last.");
}

@end
