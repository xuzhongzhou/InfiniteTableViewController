//
//  InfiniteTableViewController.h
//  InfiniteTableViewDemo
//
//  Created by Jackson on 13-5-14.
//  Copyright (c) 2013年 eshore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfiniteTableViewController : UITableViewController
{
    BOOL _endReached;
    NSInteger _numberOfSections;
}
@property (nonatomic, assign) BOOL endReached;
@property (nonatomic, assign) NSInteger numberOfSections;

@end
