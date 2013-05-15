//
//  InfiniteTableViewController.m
//  InfiniteTableViewDemo
//
//  Created by Jackson on 13-5-14.
//  Copyright (c) 2013年 eshore. All rights reserved.
//

#import "InfiniteTableViewController.h"

@interface InfiniteTableViewController ()

@end

@implementation InfiniteTableViewController
@synthesize endReached = _endReached;
@synthesize numberOfSections = _numberOfSections;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark -

- (void)loadMore
{
    NSLog(@"Override loadMore in subclass. This line should not appear on console");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.numberOfSections + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == self.numberOfSections && !self.endReached) {
        return 1;
    }
    
    // this condition should not happen.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == self.numberOfSections) {
        static NSString *CellIdentifier = @"LoadingCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        // Configure the cell...
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            UIActivityIndicatorView *newSpin = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            [newSpin startAnimating];
            [newSpin setFrame:CGRectMake( 15, 12, 20, 20) ];
            [cell addSubview:newSpin];
            [newSpin release];
        }
        cell.textLabel.text = @"加载中...";
        cell.textLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0.5 alpha:1.0];
        cell.textLabel.textAlignment = UITextAlignmentCenter;
        cell.textLabel.font = [UIFont systemFontOfSize:16];
		// other initialization goes here
        [self loadMore];
        
        return cell;
    }
    
    // this condition should not happen.
    return nil;
}

@end
