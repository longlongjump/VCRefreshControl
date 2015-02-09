//
//  VCRefreshControl.m
//
//  Created by Eugen Ovchynnykov on 5/30/14.
//  Copyright (c) 2014 VoidCore. All rights reserved.
//

#import "VCRefreshControl.h"

@interface VCRefreshControl()
@property (nonatomic) UITableViewController *tableViewController;
@end

@implementation VCRefreshControl

-(void)beginRefreshing
{
    UIScrollView *scroll_view = (id)self.superview;
    if ([scroll_view isKindOfClass:UIScrollView.class] && !self.refreshing)
    {
        scroll_view.contentOffset = CGPointMake(0, -(self.bounds.size.height + scroll_view.contentInset.top));
    }
    
    self.tableViewController = [[UITableViewController alloc] init];
    self.tableViewController.tableView = (id)self.superview;
    self.tableViewController.refreshControl = self;
    
    [super beginRefreshing];
}

-(void)endRefreshing
{
    [super endRefreshing];
    
    self.tableViewController = nil;
}

-(void)didMoveToWindow
{
    [super didMoveToWindow];
    
    if (self.window == nil)
    {
        [self endRefreshing];
    }
}

@end
