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
    NSString* description;
    NSURL* url;
    NSURL* commentsUrl;
}

@property (retain) NSString* title;
@property (retain) NSString* description;
@property (retain) NSURL* url;
@property (retain) NSURL* commentsUrl;

@end
