//
//  MasterViewController.m
//  HckrNews
//
//  Created by Chris Ledet on 1/7/12.
//  Copyright (c) 2012 Chris Ledet. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#define CELL_FONT_SIZE 14.0
#define RED   (255/255.0)
#define GREEN (99/255.0)
#define BLUE  (38/255.0)

@implementation MasterViewController

@synthesize detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Hacker News";
    }
    return self;
}
							
- (void)dealloc
{
    [detailViewController release];
    [feed release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) loadFeed
{
    if (!feed) {
        feed = [[HackerNewsFeed alloc] init];
    } else {
        [feed loadStories];
    }
    [self.tableView reloadData];
    [self stopLoading];
}

- (void) refresh
{
#ifdef DEBUG
    NSLog(@"Refreshing feed...");
#endif
    [self loadFeed];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:RED green:GREEN blue:BLUE alpha:1.0];
    [self loadFeed];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/* Customize the number of sections in the table view. */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#ifdef DEBUG
    NSLog(@"Stories count: %d", [feed.stories count]);
#endif
    return [feed.stories count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

/* Customize the appearance of table view cells. */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Feed";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    cell.textLabel.font = [UIFont systemFontOfSize:CELL_FONT_SIZE];
    Story* story = [feed.stories objectAtIndex:indexPath.section];
    cell.textLabel.text = story.title;
    return cell;
}

/* Selected Cell */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];
    }

#ifdef DEBUG
    NSLog(@"Selected Story #%d", indexPath.section);
#endif
    self.detailViewController.currentStory = [feed.stories objectAtIndex:indexPath.section];
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
