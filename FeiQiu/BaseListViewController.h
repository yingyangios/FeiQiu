//
//  BaseListViewController.h
//  FeiQiu
//
//  Created by zhaoyan on 12/28/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseListViewController : BaseViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , weak) UITableView * tableView;
@property (nonatomic , strong) NSMutableArray * rows;
@end
