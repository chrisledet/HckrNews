//
//  Story.h
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject {
    NSString* title;
    NSURL* url;
    NSURL* commentsUrl;
}

@property (retain, nonatomic) NSString* title;
@property (retain, nonatomic) NSURL* url;
@property (retain, nonatomic) NSURL* commentsUrl;

- (NSString*) commentsUrlAsString;

@end
