//
//  ViewController.m
//  InfiniteTableViewDemo
//
//  Created by Jackson on 13-5-14.
//  Copyright (c) 2013年 eshore. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // 设置numberOfSections
    self.numberOfSections = 1;
    
    pageCount = 1;
}

- (void)loadMore {
    // 当服务器不再 12 返回内容时,应该把 endReached 属性置为 YES。这样可以防止状态加载单元格再次被显示出来。
    double delayInSeconds = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        pageCount ++;
        if (pageCount == 5) self.endReached = YES;
        [self.tableView reloadData];
    });
}

#pragma mark - Table View DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return the number of rows in the section.
    if (indexPath.section == self.numberOfSections)  {
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
     // 子控制器的cellForRowAtIndexPath
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == self.numberOfSections) {
        return [super tableView:tableView numberOfRowsInSection:section];
    }
    
    // 子控制器的numberOfRowsInSection
    return 20*pageCount;
}

@end
