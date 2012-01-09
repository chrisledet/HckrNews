//
//  DetailViewController.m
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void) configureView;
@end

@implementation DetailViewController

@synthesize currentStory, storyWebView;

- (void)dealloc
{
    [currentStory release];
    [super dealloc];
}

#pragma mark - Managing the current story

- (void)setCurrentStory:(Story *)story
{
    if (currentStory != story) {
        [currentStory release];
        currentStory = [story retain];
        [self configureView];
    }
}

- (void)configureView
{
    /* Update the UI for the current story */
    if (currentStory) {
        self.title = currentStory.title;
        NSURLRequest* request = [[NSURLRequest alloc] initWithURL:currentStory.url];
        [storyWebView loadRequest:request];
        [request release];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)viewDidUnload
{
    [currentStory release];
    [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
    [storyWebView stopLoading];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}
							
@end
