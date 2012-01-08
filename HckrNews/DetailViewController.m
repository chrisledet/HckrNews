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
@end

@implementation DetailViewController

@synthesize currentStory = _currentStory;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize detailWebView = _detailWebView;

- (void)dealloc
{
    [_currentStory release];
    [_detailDescriptionLabel release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setCurrentStory:(Story *)currentStory
{
    if (_currentStory != currentStory) {
        [_currentStory release]; 
        _currentStory = [currentStory retain]; 
        [self configureView];
    }
}

- (void)configureView
{
    /* Update the UI for the current story */
    if (_currentStory) {
        self.title = _currentStory.title;
        NSURLRequest* request = [[NSURLRequest alloc] initWithURL:_currentStory.url];
        [self.detailWebView loadRequest:request];
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
    [_currentStory release];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Title goes here";
    }
    return self;
}
							
@end
