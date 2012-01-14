//
//  DetailViewController.m
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
- (void)showURLonWebView:(NSURL*)urlString;
@end

@implementation DetailViewController

@synthesize currentStory, webView, commentsButtonItem;

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
        [self showURLonWebView:currentStory.url];
    }
}

- (IBAction)viewStoryCommentsPage:(id)sender;
{
    /* Update the web view for the current story's comments */
    if (currentStory) {
        [self showURLonWebView:currentStory.commentsUrl];
    }
}

- (void)showURLonWebView:(NSURL *)url
{
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    [request release];
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
    [webView stopLoading];
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
