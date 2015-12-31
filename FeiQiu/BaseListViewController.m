//
//  BaseListViewController.m
//  FeiQiu
//
//  Created by zhaoyan on 12/28/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import "BaseListViewController.h"

@implementation BaseListViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    UITableView * tableVeiw = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableVeiw.delegate = self;
    tableVeiw.dataSource = self;
    self.tableView = tableVeiw;
    [self.view addSubview:tableVeiw];
    
    if(!_rows)
    {
        _rows = [NSMutableArray array];
    }
    
}

-(void)viewDidAppear:(BOOL)animated
{
    self.tableView.height =self.view.height;
}
@end
