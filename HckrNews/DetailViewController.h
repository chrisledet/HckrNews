//
//  DetailViewController.h
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Story.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Story* currentStory;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) IBOutlet UIWebView *detailWebView;

@end
