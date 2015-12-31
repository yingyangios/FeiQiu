//
//  FlipViewControllers.h
//  FeiQiu
//
//  Created by zhaoyan on 12/30/15.
//  Copyright © 2015 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlipViewControllers : UIViewController

@property (nonatomic , strong) NSMutableArray * viewcontrollers;
@property (nonatomic , strong) UIViewController * rootViewController;

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController;

-(void)pushViewController:(UIViewController *) pushVC;

-(void)popViewController:(UIViewController *)popVC;

@end
